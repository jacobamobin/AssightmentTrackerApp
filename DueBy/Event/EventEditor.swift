//
//  EventEditor.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-29.
//

import Foundation
import SwiftUI
import SwiftData

struct EventEditor: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @Query private var events: [Event]
    @Query private var classes: [Classes]
    
    @State private var eventTitle: String
    @State private var eventDate: Date
    @State private var className: String = ""
    @State private var eventColor: Color
    @State private var eventType: Int
    
    // Pass the event into the editor and initialize state properties
    init(event: Event) {
        _eventTitle = State(initialValue: event.name)
        _eventDate = State(initialValue: event.dueDate)
        _className = State(initialValue: event.className)
        _eventColor = State(initialValue: Color.gray) // Customize this to set the color properly
        _eventType = State(initialValue: event.type)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Event Title", text: $eventTitle)
                
                Picker("Event Type", selection: $eventType) {
                    Text("Assignment").tag(1)
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
                
                DatePicker("Event Date", selection: $eventDate, displayedComponents: .date)
                Picker("Class Name", selection: $className) {
                    ForEach(classes, id: \.self) { item in
                        Text(item.name).tag(item.name)
                    }
                }
                
            }
            .navigationTitle("Edit Work")
            .toolbar {
                Button("Save") {
                    // Find the event to update and save the changes
                    if let eventToUpdate = events.first(where: { $0.id == eventTitle }) {
                        eventToUpdate.name = eventTitle
                        eventToUpdate.dueDate = eventDate
                        eventToUpdate.className = className
                        eventToUpdate.type = eventType
                        // Add any other properties to update
                        try? context.save() // Save the context
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EventEditor(event: Event(name: "Sample Event", dueDate: Date(), type: 0, className: "Sample Class", isCompleted: false))
}
