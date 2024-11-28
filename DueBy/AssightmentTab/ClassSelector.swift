//
//  ClassSelector.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//
import SwiftUI

struct ClassSelector: View {
    var classes: [String: Color] = [
        "MTH110": .blue,
        "CPS213": .green,
        "CPS109": .yellow,
        "PCS110": .purple,
        "DST300": .red
    ]
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
            let baseColor = classes[className] ?? .gray
            let secondaryColor = colorDictionary[baseColor] ?? .gray
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
                ForEach(classes.keys.sorted(), id: \.self) { className in
                    Button {
                        selectedClass = (selectedClass == className) ? nil : className
                    } label: {
                        Text(className)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(fillColor(for: className))
                            )
                            .animation(.default, value: selectedClass)
                            .accessibilityLabel("Select \(className)")
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

