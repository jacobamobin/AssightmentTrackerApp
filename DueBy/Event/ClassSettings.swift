//
//  ClassSettings.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-28.
//

import SwiftUI
import SwiftData

struct ClassSettings: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var classes: [Classes]
    
    let colorOptions: [String] = ["red", "orange", "yellow", "green", "teal", "blue", "indigo", "purple", "pink", "gray"]
    
    var body: some View {
        VStack {
            Text("Manage Classes")
                .font(.largeTitle)
                .padding()
            
            List {
                ForEach(classes) { subject in
                    HStack {
                        // Editable text field for class name
                        TextField(
                            "Class Name",
                            text: Binding(
                                get: { subject.name },
                                set: { newValue in
                                    updateClass(subject: subject, newName: newValue)
                                }
                            )
                        )
                        .textFieldStyle(.plain)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 3)
                        
                        // Color indicator with menu for selection
                        Menu {
                            ForEach(colorOptions, id: \.self) { color in
                                Button(action: {
                                    updateColor(subject: subject, newColor: color)
                                }) {
                                    HStack {
                                        Circle()
                                            .fill(convertColorString(color))
                                            .frame(width: 20, height: 20)
                                        Text(color.capitalized)
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(convertColorString(subject.colorString))
                                .frame(width: 100, height: 50)
                        }
                    }
                    .swipeActions { // Custom swipe actions
                        withAnimation(.default) {
                            Button(role: .destructive, action: {
                                deleteClass(subject: subject)
                            }) {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            .tint(.red) // Custom delete color
                        }
                        
                    }
                }
                
                // Add Class Button
                Button("Add Class") {
                    addClass()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 8)
            }
        }
        .padding()
    }
    
    /// Converts a string to a SwiftUI Color.
    func convertColorString(_ colorString: String) -> Color {
        switch colorString.lowercased() {
        case "red":
            return .red
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "green":
            return .green
        case "teal":
            return .teal
        case "blue":
            return .blue
        case "indigo":
            return .indigo
        case "purple":
            return .purple
        case "pink":
            return .pink
        case "gray", "grey":
            return .gray
        default:
            return .gray // Default color
        }
    }

    /// Adds a new class with default values.
    func addClass() {
        let newItem = Classes(name: "New Class", colorString: "gray")
        context.insert(newItem)
    }

    /// Updates the color of a class and saves the context.
    func updateColor(subject: Classes, newColor: String) {
        subject.colorString = newColor
        try? context.save()
    }

    /// Updates the name of a class and saves the context.
    func updateClass(subject: Classes, newName: String) {
        subject.name = newName
        try? context.save()
    }

    /// Deletes a class from the context.
    func deleteClass(subject: Classes) {
        context.delete(subject)
        try? context.save()
    }
}

#Preview {
    ClassSettings()
}
