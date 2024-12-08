//
//  SearchScrollingSection.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-12-08.
//

import SwiftUI
import SwiftData

struct SearchScrollingSection: View {
    @Environment(\.modelContext) private var context
    
    var events: [Event]
    var classes: [Classes]
    @Binding var selectedClass: String?
    @State private var showCompleted: Bool = false
    
    @State private var isEditing: Bool = false
    @State private var eventToEdit: Event? = nil
    
    var body: some View {
        VStack(spacing: 5) {
            // Group and sort events into the defined categories
            let groupedEvents = groupEvents(events)
            
            ForEach(["Overdue", "Today", "Soon", "Upcoming", "Completed"], id: \.self) { category in
                if let items = groupedEvents[category], !items.isEmpty {
                    
                    ForEach(items) { item in
                        if showCompleted == true {
                            if selectedClass == nil || item.className == selectedClass {
                                eventItemView(for: item)
                            } else {
                                if selectedClass == nil || item.className == selectedClass && item.isCompleted == false {
                                    eventItemView(for: item)
                                }
                            }
                        }

                    }
                    
                }
            }
        }
        .sheet(item: $eventToEdit) { event in
            EventEditor(event: event)
        }
    }
    
    private func eventItemView(for item: Event) -> some View {
        Item(
            eventTitle: item.name,
            eventDate: item.dueDate,
            className: item.className,
            type: item.type,
            isCompleted: item.isCompleted
        )
        .contextMenu {
            Button {
                completeItem(item)
            } label: {
                Label("Complete", systemImage: "checkmark.circle")
            }
            Button {
                editItem(item)
            } label: {
                Label("Edit", systemImage: "pencil")
            }
            Button(role: .destructive) {
                deleteItem(item)
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            
        }
    }
    
    private func deleteItem(_ item: Event) {
        context.delete(item)
    }
    
    private func editItem(_ item: Event) {
        eventToEdit = item
    }
    
    private func completeItem(_ item: Event) {
        item.isCompleted = true
        try? context.save()
    }
    
    private func eventColor(for className: String) -> Color {
        if let classObject = classes.first(where: { $0.name == className }) {
            return convertColorString(classObject.colorString)
        }
        return .gray
    }
    
    private func groupEvents(_ events: [Event]) -> [String: [Event]] {
        let now = Date()
        let calendar = Calendar.current
        
        // Define date ranges for each category
        let startOfToday = calendar.startOfDay(for: now)
        let endOfToday = calendar.date(byAdding: .day, value: 1, to: startOfToday)!
        let endOfSoon = calendar.date(byAdding: .hour, value: 72, to: now)!
        
        var grouped: [String: [Event]] = [
            "Overdue": [],
            "Today": [],
            "Next 3 Days": [],
            "Upcoming": [],
            "Completed": []
        ]
        
        for event in events {
            if event.isCompleted == false {
                if event.dueDate < now {
                    grouped["Overdue"]?.append(event)
                } else if event.dueDate < endOfToday {
                    grouped["Today"]?.append(event)
                } else if event.dueDate < endOfSoon {
                    grouped["Soon"]?.append(event)
                } else {
                    grouped["Upcoming"]?.append(event)
                }
            } else {
                grouped["Completed"]?.append(event)
            }
            
        }
        
        // Sort events in each category by due date
        for category in grouped.keys {
            grouped[category]?.sort { $0.dueDate < $1.dueDate }
        }
        
        return grouped
    }
}


#Preview {
    SearchScrollingSection(
        events: [
            Event(name: "Homework 1", dueDate: Date(), type: 0, className: "Math", isCompleted: false),
            Event(name: "Project", dueDate: Date(), type: 1, className: "Science", isCompleted: true)
        ],
        classes: [
            Classes(name: "Math", colorString: "blue"),
            Classes(name: "Science", colorString: "red")
        ],
        selectedClass: .constant(nil)
    )
}
