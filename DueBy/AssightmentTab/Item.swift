//
//  Item.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI


struct Item: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var eventTitle: String
    var eventDate: Date
    var className: String
    var type: Int
        
    init(eventTitle: String, eventDate: Date, className: String, eventColor: Color, type: Int) {
        self.eventTitle = eventTitle
        self.eventDate = eventDate
        self.className = className
        self.type = type
    }
    
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
    
    private func fillColor(for className: String) -> LinearGradient {
        let baseColor = classes[className] ?? .gray
        let secondaryColor = colorDictionary[baseColor] ?? .gray
        
        // Return the LinearGradient directly
        return LinearGradient(
            colors: [baseColor, secondaryColor],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    private func eventColor() -> Color {
        return classes[className] ?? .gray
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4) //Background Rect
                .frame(width: .infinity, height: 80)
                .padding(8)
                //.foregroundColor(eventColor.opacity(0.5))
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


//Types
//1) Assightment
//2) Homework
//3) Culminating
//4) Lab
//4) Essay
//5) Project
//6) Presentation
//7) Quiz
//8) Test
//9) Midterm
//10) Exam

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
    Item(eventTitle: "Culminating", eventDate: Date(), className: "PCS110", eventColor: .blue, type: 6)

}
