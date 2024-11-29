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
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HomeHeader()
                    
                    Stats()
                    
                    ClassSelector()
                    
                    VStack {
                        ScrollView {
                            ForEach(events) { item in
                                // Ensure eventColor is correctly derived from classes
                                Item(eventTitle: item.className, eventDate: item.dueDate,
                                     className: item.className,
                                     type: item.type)
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
    
    // Helper function to determine the event color based on the className
    private func eventColor(for className: String) -> Color {
        // Find the class with the given name
        if let classObject = classes.first(where: { $0.name == className }) {
            return convertColorString(classObject.colorString) // Use your existing color conversion logic
        }
        return .gray // Default if class not found
    }
    
    func addItem() {
        // Create a new Event object
        let item = Event(name: "Test Item", dueDate: Date(), type: 0, className: "Test Class", isCompleted: false)
        context.insert(item) // Insert into model context
    }
}

#Preview {
    Home()
}

