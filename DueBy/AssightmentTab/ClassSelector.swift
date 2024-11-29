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

    // Example color dictionary (update according to your needs)
    var colorDictionary: [Color: Color] = [
        .red: .orange,
        .orange: .yellow,
        .yellow: .green,
        .green: .teal,
        .teal: .blue,
        .blue: .indigo,
        .indigo: .purple,
        .purple: .pink,
        .pink: .red,
        .gray: .gray
    ]
    
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
    
    @State private var selectedClass: String?

    // Helper Function to Get Fill Color
    private func fillColor(for className: String, classColor: String) -> AnyShapeStyle {
        if selectedClass == className {
            let baseColor = convertColorString(classColor.lowercased())
            let secondaryColor = colorDictionary[baseColor] ?? .gray
            return AnyShapeStyle(
                LinearGradient(
                    colors: [baseColor, secondaryColor.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        } else {
            return AnyShapeStyle(.gray.opacity(0.8)) // Default fill for unselected classes
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
                                    .fill(fillColor(for: classItem.name, classItem.color))
                            )
                            .animation(.default, value: selectedClass)
                            .accessibilityLabel("Select \(classItem.name)")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

// Preview
#Preview {
    ClassSelector()
}

