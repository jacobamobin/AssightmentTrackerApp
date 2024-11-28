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
    
    @Query private var items: [Event]
    
    var body: some View {
        NavigationStack {
            VStack {
                HomeHeader()
                
                Stats()
                
                ClassSelector()
                
                VStack {
                    Text("Add events")
                    Button("add an item") {
                        addItem()
                    }
                    
                    List {
                        ForEach(items) { item in
                            Text(item.name)
                        }
                    }
                }
                
            }.padding(5)
            
        }
    }
        
    func addItem() {
            
        let item = Event(name: "Test Item")
        context.insert(item)
        
    }
}

#Preview {
    Home()
}
