//
//  HomeScrollingSection.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-12-01.
//

import SwiftUI
import SwiftData

struct HomeScrollingSection: View {
    @Environment(\.modelContext) private var context
    
    var events: [Event]
    var classes: [Classes]
    @Binding var selectedClass: String?
    
    @State private var isEditing: Bool = false
    @State private var eventToEdit: Event? = nil
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(events) { item in
                // Filter the events based on the selected class
                if selectedClass == nil || item.className == selectedClass {
                    eventItemView(for: item)
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
            Button(role: .destructive) {
                deleteItem(item)
            } label: {
                Label("Delete", systemImage: "trash")
            }
            
            Button {
                editItem(item)
            } label: {
                Label("Edit", systemImage: "pencil")
            }
        }
    }
    
    private func deleteItem(_ item: Event) {
        context.delete(item)
    }
    
    private func editItem(_ item: Event) {
        eventToEdit = item
    }
    
    private func eventColor(for className: String) -> Color {
        if let classObject = classes.first(where: { $0.name == className }) {
            return convertColorString(classObject.colorString)
        }
        return .gray
    }
}


#Preview {
    HomeScrollingSection(
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
