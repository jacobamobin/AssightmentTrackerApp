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
                        Text("Add events")
                        Button("add an item") {
                            addItem()
                        }
                        
                        ScrollView {
                            ForEach(events) { item in
                                Item(eventTitle: item.className, eventDate: item.dueDate,
                                     className: item.className,
                                     eventColor: Color.blue,
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
        
    func addItem() {
            
        let item = Event(name: "Test Item", dueDate: Date(), type: 0, className: "Test Class", isCompleted: false)
        context.insert(item)
        
    }
}

#Preview {
    Home()
}
