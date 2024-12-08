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
    @Binding var showExpired: Bool

    @State private var eventToEdit: Event? = nil

    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                // Group and sort events into the defined categories
                let groupedEvents = groupEvents(events)

                // Calculate the total number of visible items
                let totalVisibleItems = groupedEvents.flatMap { $0.value }
                    .filter { shouldDisplayEvent($0) }
                    .count

                // Render categories and items
                ForEach(["Overdue", "Today", "Soon", "Upcoming", "Completed"], id: \.self) { category in
                    if let items = groupedEvents[category], !items.isEmpty {
                        Section {
                            ForEach(items.filter { shouldDisplayEvent($0) }) { item in
                                eventItemView(for: item)
                            }
                        }
                    }
                }

                // Show "No Items" view if no items are visible
                if totalVisibleItems == 0 {
                    NoItemSearch()
                }
            }
            .sheet(item: $eventToEdit) { event in
                EventEditor(event: event)
            }
        }
    }

    private func shouldDisplayEvent(_ item: Event) -> Bool {
        // Filter logic for display
        if !showExpired && item.isCompleted {
            return false
        }
        if let selectedClass = selectedClass, item.className != selectedClass {
            return false
        }
        return true
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
                    .foregroundStyle(.green)
            }
            Button {
                editItem(item)
            } label: {
                Label("Edit", systemImage: "pencil")
                    .foregroundStyle(.yellow)
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
            "Soon": [],
            "Upcoming": [],
            "Completed": []
        ]

        for event in events {
            if event.isCompleted {
                grouped["Completed"]?.append(event)
            } else if event.dueDate < now {
                grouped["Overdue"]?.append(event)
            } else if event.dueDate < endOfToday {
                grouped["Today"]?.append(event)
            } else if event.dueDate < endOfSoon {
                grouped["Soon"]?.append(event)
            } else {
                grouped["Upcoming"]?.append(event)
            }
        }

        // Sort events in each category by due date
        for category in grouped.keys {
            grouped[category]?.sort { $0.dueDate < $1.dueDate }
        }

        return grouped
    }
}


