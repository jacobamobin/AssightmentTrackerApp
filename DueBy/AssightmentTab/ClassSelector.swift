//
//  ClassSelector.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//
import SwiftUI
import SwiftData

struct ClassSelector: View {
    
    @Query var classes: [Classes]
    
    // Updated color dictionary using strings as keys
    var colorDictionary: [String: Color] = [
        "red": .orange,
        "orange": .yellow,
        "yellow": .green,
        "green": .teal,
        "teal": .blue,
        "blue": .indigo,
        "indigo": .purple,
        "purple": .pink,
        "pink": .red,
        "gray": .gray
    ]
    
    @Binding var selectedClass: String? 
    @State private var precomputedStyles: [String: AnyShapeStyle] = [:]

    func convertColorString(_ colorString: String) -> Color {
        switch colorString.lowercased() {
        case "red": return .red
        case "orange": return .orange
        case "yellow": return .yellow
        case "green": return .green
        case "teal": return .teal
        case "blue": return .blue
        case "indigo": return .indigo
        case "purple": return .purple
        case "pink": return .pink
        case "gray", "grey": return .gray
        default: return .gray // Default fallback color
        }
    }

    // Precompute the gradient styles for all classes
    private func computeStyles() {
        precomputedStyles = classes.reduce(into: [:]) { result, classItem in
            let baseColor = convertColorString(classItem.colorString.lowercased())
            let secondaryColor = colorDictionary[classItem.colorString.lowercased()] ?? .gray
            let gradientStyle = AnyShapeStyle(
                LinearGradient(
                    colors: [baseColor, secondaryColor.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            result[classItem.name] = gradientStyle
        }
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                // Settings Wheel
                NavigationLink(destination: ClassSettings()) {
                    Image(systemName: "gearshape")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray.opacity(0.7))
                        )
                        .accessibilityLabel("Settings")
                }
                
                // Class Tickers
                ForEach(classes, id: \.self) { classItem in
                    Button {
                        selectedClass = (selectedClass == classItem.name) ? nil : classItem.name
                    } label: {
                        Text(classItem.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(selectedClass == classItem.name
                                          ? precomputedStyles[classItem.name] ?? AnyShapeStyle(.gray)
                                          : AnyShapeStyle(.gray.opacity(0.8))
                                    )
                            )
                            .animation(.default, value: selectedClass)
                            .accessibilityLabel("Select \(classItem.name)")
                    }
                }
            }
            .padding(.horizontal)
            .onAppear {
                computeStyles() // Precompute styles when the view appears
            }
            .onChange(of: classes) { _ in
                computeStyles() // Recompute styles when classes change
            }
        }
    }
}

