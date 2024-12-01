//
//  EventManager.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import Foundation
import SwiftUI
import SwiftData

struct EventAdder: View {
    //Enviorment
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    //Swift Data Models
    @Query private var events: [Event]
    @Query private var classes: [Classes]
    
    //Text for Item
    @State private var eventTitle: String = ""
    @State private var eventDate: Date = .now
    @State private var className: String = ""
    @State private var eventColor: Color = .gray
    @State private var eventType: Int = 1
    
    
    var body: some View {
        NavigationStack {
            //Demo At Top
            Item(eventTitle: eventTitle, eventDate: eventDate, className: className, type: eventType, isCompleted: false)
            
            //Text Fields
            Form {
                //Name
                TextField("Event Title", text: $eventTitle)
                //Work Type
                Picker("Event Type", selection: $eventType) {
                    
                    Text("Assightment").tag(1)
                    Text("Homework").tag(2)
                    Text("Culminating").tag(3)
                    Text("Lab").tag(4)
                    Text("Essay").tag(5)
                    Text("Project").tag(6)
                    Text("Presentation").tag(7)
                    Text("Quiz").tag(8)
                    Text("Test").tag(9)
                    Text("Midterm").tag(10)
                    Text("Exam").tag(11)
                    
                }
                
                //Date Picker
                DatePicker("Event Date", selection: $eventDate, displayedComponents: .date)
                
                //Class Picker
                Picker("Class Name", selection: $className) {
                    ForEach(classes, id: \.self) { item in
                        Text(item.name).tag(item.name)
                    }
                }
                
                
                
                //ColorPicker("Event Color", selection: $eventColor)
            }
            .navigationTitle("Add Work")
            .toolbar {
                Button("Save") {
                    let item = Event(name: eventTitle, dueDate: eventDate, type: eventType, className: className, isCompleted: false)
                    context.insert(item) //Save Item
                    dismiss() //Dismiss Navigation

                }
            }
        }
    }
}

#Preview {
    EventAdder()
}
