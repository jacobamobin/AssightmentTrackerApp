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
    // Get Context
    @Environment(\.modelContext) private var context
    // Allow Dismissal of the UI
    @Environment(\.dismiss) private var dismiss
    
    // Variables for the event being edited
    @State private var event: Event
    
    // Query classes for the picker
    @Query private var classes: [Classes]
    
    // Initialize the view with an event
    init(event: Event) {
        _event = State(initialValue: event)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Demo Event Preview
                Item(
                    eventTitle: event.name,
                    eventDate: event.dueDate,
                    className: event.className,
                    type: event.type,
                    isCompleted: event.isCompleted
                )
                
                // Input Fields
                Form {
                    // Event Title
                    TextField("Event Title", text: $event.name)
                    
                    // Event Type
                    Picker("Event Type", selection: $event.type) {
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
                    
                    // Event Date
                    DatePicker("Event Date", selection: $event.dueDate, displayedComponents: [.date, .hourAndMinute])
                    
                    // Class Picker
                    Picker("Class Name", selection: $event.className) {
                        ForEach(classes, id: \.name) { item in
                            Text(item.name).tag(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Edit Work")
            .toolbar {
                // Save Edits
                Button("Save") {
                    try? context.save()
                    dismiss()
                }
            }
        }
    }
}


#Preview {
    EventEditor(event: Event(name: "Sample Event", dueDate: Date(), type: 0, className: "Sample Class", isCompleted: false))
}
