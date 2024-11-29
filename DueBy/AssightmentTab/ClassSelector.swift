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
    
    @State private var selectedClass: String?

    // Helper Function to Get Fill Color
    private func fillColor(for className: String) -> AnyShapeStyle {
        if selectedClass == className {
            let baseColor = convertColorString(className)
            let secondaryColor = colorDictionary[convertColorString(className)] ?? .gray
            return AnyShapeStyle(
                LinearGradient(
                    colors: [baseColor, secondaryColor.opacity(0.8)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        } else {
            return AnyShapeStyle(.gray.opacity(0.8))
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
                                    .fill(fillColor(for: classItem.name))
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

