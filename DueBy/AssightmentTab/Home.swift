//
//  Home.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//
import SwiftUI
import SwiftData

struct Home: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var events: [Event]
    @Query private var classes: [Classes]
    
    @State private var selectedClass: String? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HomeHeader(selectedClass: $selectedClass)
                    
                    Stats()
                    
                    ClassSelector(selectedClass: $selectedClass)
                    
                    VStack {
                        ScrollView {
                            ForEach(events) { item in
                                // Filter the events based on the selected class
                                if let selectedClass = selectedClass {
                                    // Show only events that match the selected class
                                    if item.className == selectedClass {
                                        eventItemView(for: item)
                                    }
                                } else {
                                    // Show all events if no class is selected
                                    eventItemView(for: item)
                                }
                            }
                        }
                    }
                    
                }.padding(5)
                
                VStack(alignment: .trailing) {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Spacer()
                        NavigationLink(destination: EventAdder()) {
                            AddButton()
                        }
                    }.padding(5)
                }.padding(5)
                
            }
        }
    }
    
    // Helper function to generate the event item view
    private func eventItemView(for item: Event) -> some View {
        Item(eventTitle: item.name,
             eventDate: item.dueDate,
             className: item.className,
             type: item.type)
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
    
    // Helper function to determine the event color based on the className
    private func eventColor(for className: String) -> Color {
        // Find the class with the given name
        if let classObject = classes.first(where: { $0.name == className }) {
            return convertColorString(classObject.colorString) // Use your existing color conversion logic
        }
        return .gray // Default if class not found
    }
    
    // Add a new Event (for demonstration purposes)
    func addItem() {
        let item = Event(name: "Test Item", dueDate: Date(), type: 0, className: "Test Class", isCompleted: false)
        context.insert(item)
    }
    
    // Delete an Event
    func deleteItem(_ item: Event) {
        context.delete(item)
    }
    
    // Edit an Event (navigate to an edit view or perform inline editing)
    func editItem(_ item: Event) {
        
    }
}

#Preview {
    Home()
}


