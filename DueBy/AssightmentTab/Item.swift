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
                
                VStack(alignment: .leading) {
                    Text(eventTitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    

                    
                    Text(TypeText(type))
                }
                
                
                Spacer()
                    
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



func TypeText(_ type: Int) -> String {
    switch type {
        case 1:
            return "Assignment"
        case 2:
            return "Homework"
        case 3:
            return "Culminating"
        case 4:
            return "Essay"
        case 5:
            return "Project"
        case 6:
            return "Presentation"
        case 7:
            return "Quiz"
        case 8:
            return "Test"
        case 9:
            return "Midterm"
        case 10:
            return "Exam"
        default:
            return "Unknown"
    }
}

#Preview {
    Item(eventTitle: "Culminating", eventDate: Date(), className: "Math 101", eventColor: .blue, type: 1)

}
