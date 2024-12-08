//
//  Item.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI
import SwiftData

struct Item: View {
    
    //Enviorment Variables and Model Context
    @Environment(\.colorScheme) var colorScheme //Device Color Theme
    @Environment(\.modelContext) private var context //Model
    @Query var classes: [Classes]
    @Query var events: [Event]
    
    var eventTitle: String  //The Name of the event
    var eventDate: Date     //The Due Date of the event
    var className: String   //The Class associated with the event (For color)
    var type: Int           //The Type of Assightment
    var isCompleted: Bool   //If Assightment is completed
        
    //Init
    init(eventTitle: String, eventDate: Date, className: String, type: Int, isCompleted: Bool) {
        self.eventTitle = eventTitle
        self.eventDate = eventDate
        self.className = className
        self.type = type
        self.isCompleted = false
    }
    
    //Color Dictonary used for Gradient
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
    
    //Calculates the Time Remaining, if completed show completed
    var timeRemainingText: String {
        let now = Date()
        let difference = Calendar.current.dateComponents([.day, .hour, .minute], from: now, to: eventDate)
        
        if !isCompleted {
            if let days = difference.day, days > 0 {
                return "In \(days) Days"
            } else if let hours = difference.hour, hours > 0 {
                return "In \(hours) Hours"
            } else if let minutes = difference.minute, minutes > 0 {
                return "In \(minutes) Minutes"
            } else {
                return "Overdue"
            }
        } else {
            return "Completed"
        }
        
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4) // Background Rect
                .frame(height: 80)
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
                    Text(timeRemainingText)
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
    
    private func fillColor(for className: String) -> LinearGradient {
        // Find the class object from the classes array by class name
        if let classObject = classes.first(where: { $0.name == className }) {
            let baseColor = convertColorString(classObject.colorString) // Convert colorString to Color
            let secondaryColor = colorDictionary[baseColor] ?? .gray
            
            if isCompleted == true {
                return LinearGradient(
                    colors: [.gray, .gray],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
            return LinearGradient(
                colors: [baseColor, secondaryColor],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
        return LinearGradient(colors: [.gray, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)  // Fallback
    }

    //Handler for convering the classes colorString to a SwiftUI Color
    //This is because SwiftData cannot handle SwiftUi Colors
    private func eventColor() -> Color {
        // Find the class object and convert colorString to Color
        if let classObject = classes.first(where: { $0.name == className }) {
            return convertColorString(classObject.colorString)
        }
        return .gray // Default if class not found
    }
}

//This is for the Assightment Types, each Work type is assisgned a SF Symbol
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
    Item(eventTitle: "Culminating", eventDate: Date(), className: "PCS110", type: 6, isCompleted: true)
}

