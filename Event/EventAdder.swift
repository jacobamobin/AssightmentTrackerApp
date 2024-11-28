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
    @Environment(\.modelContext) private var context
    
    @Query private var events: [Event]
    
    @State private var eventTitle: String = ""
    @State private var eventDate: Date = .now
    @State private var className: String = ""
    @State private var eventColor: Color = .gray
    @State private var eventType: Int = 1
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Event Title", text: $eventTitle)
                DatePicker("Event Date", selection: $eventDate, displayedComponents: .date)
                TextField("Class Name", text: $className)
                Picker("Event Type", selection: $eventType) {
                    
                    Text("Assightment").tag(1)
                    Text("Homework").tag(2)
                    Text("Culminating").tag(3)
                    Text("Essay").tag(4)
                    Text("Project").tag(5)
                    Text("Presentation").tag(6)
                    Text("Quiz").tag(7)
                    Text("Test").tag(8)
                    Text("Midterm").tag(9)
                    Text("Exam").tag(10)
                    
                }
                //ColorPicker("Event Color", selection: $eventColor)
            }
            .navigationTitle("Add Work")
            .toolbar {
                Button("Save") {
                    let item = Event(name: eventTitle, dueDate: eventDate, type: eventType, className: className, isCompleted: false)
                    context.insert(item)
                }
            }
        }
    }
}

#Preview {
    EventAdder()
}
