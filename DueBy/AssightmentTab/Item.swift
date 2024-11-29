//
//  Item.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI
import SwiftData

struct Item: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Query var classes: [Classes]  // Query to fetch all classes
    
    var eventTitle: String
    var eventDate: Date
    var className: String
    var type: Int
        
    init(eventTitle: String, eventDate: Date, className: String, type: Int) {
        self.eventTitle = eventTitle
        self.eventDate = eventDate
        self.className = className
        self.type = type
    }
    
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
    
    private func fillColor(for className: String) -> LinearGradient {
        // Find the class object from the classes array by class name
        if let classObject = classes.first(where: { $0.name == className }) {
            let baseColor = convertColorString(classObject.colorString) // Convert colorString to Color
            let secondaryColor = colorDictionary[baseColor] ?? .gray
            
            return LinearGradient(
                colors: [baseColor, secondaryColor],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
        return LinearGradient(colors: [.gray, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)  // Fallback
    }
    
    private func eventColor() -> Color {
        // Find the class object and convert colorString to Color
        if let classObject = classes.first(where: { $0.name == className }) {
            return convertColorString(classObject.colorString)
        }
        return .gray // Default if class not found
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4) // Background Rect
                .frame(width: .infinity, height: 80)
                .padding(8)
                .foregroundStyle(
                    colorScheme == .dark
                        ? fillColor(for: className).opacity(0.4)
                        : fillColor(for: className).opacity(0.85)
                )
                .shadow(radius: 4)
            
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 5, height: 70)
                    .foregroundColor(eventColor())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(eventTitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 4) {
                        Image(systemName: TypeText(type).0)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white.opacity(0.6))

                        Text(TypeText(type).1)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("In 3 Days")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(eventDate, format: .dateTime.day().month().year())
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                    
                    Text(className)
                        .fontWeight(.bold)
                        .foregroundColor(.white.opacity(0.8))
                    
                }.padding(.trailing, 5)
            }.padding()
        }
    }
}

// TypeText function unchanged
func TypeText(_ type: Int) -> (String, String) {
    switch type {
    case 1:
        return ("pencil.circle.fill", "Assignment")
    case 2:
        return ("book.fill", "Homework")
    case 3:
        return ("calendar.circle.fill", "Culminating")
    case 4:
        return ("testtube.fill", "Lab")
    case 5:
        return ("doc.text.fill", "Essay")
    case 6:
        return ("folder.fill", "Project")
    case 7:
        return ("speaker.fill", "Presentation")
    case 8:
        return ("pencil.and.list.clipboard", "Quiz")
    case 9:
        return ("pencil.and.list.clipboard", "Test")
    case 10:
        return ("pencil.and.list.clipboard", "Midterm")
    case 11:
        return ("pencil.and.list.clipboard", "Exam")
    default:
        return ("questionmark.circle.fill", "Unknown")
    }
}

#Preview {
    Item(eventTitle: "Culminating", eventDate: Date(), className: "PCS110", type: 6)
}

