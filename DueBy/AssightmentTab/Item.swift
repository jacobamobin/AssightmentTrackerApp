//
//  Item.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI


struct Item: View {
    
    var eventTitle: String
    var eventDate: Date
    var className: String
    var eventColor: Color
    var type: Int
        
    init(eventTitle: String, eventDate: Date, className: String, eventColor: Color, type: Int) {
        self.eventTitle = eventTitle
        self.eventDate = eventDate
        self.className = className
        self.eventColor = eventColor
        self.type = type
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4) //Background Rect
                .frame(width: .infinity, height: 80)
                .padding(8)
                .foregroundColor(eventColor.opacity(0.5))
            
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 5, height: 70)
                    .foregroundColor(eventColor)
                
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
                    
                    Text(eventDate, format: .dateTime.day().month().year())
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                    
                    Text(className)
                    
                }.padding(.trailing, 5)
                
                    
            }.padding()
        }
        
    }
}


//Types
//1) Assightment
//2) Homework
//3) Culminating
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
        return ("doc.text.fill", "Essay")
    case 5:
        return ("folder.fill", "Project")
    case 6:
        return ("speaker.fill", "Presentation")
    case 7:
        return ("pencil.and.list.clipboard", "Quiz")
    case 8:
        return ("pencil.and.list.clipboard", "Test")
    case 9:
        return ("pencil.and.list.clipboard", "Midterm")
    case 10:
        return ("pencil.and.list.clipboard", "Exam")
    default:
        return ("questionmark.circle.fill", "Unknown")
    }
}

#Preview {
    Item(eventTitle: "Culminating", eventDate: Date(), className: "Math 101", eventColor: .blue, type: 10)

}
