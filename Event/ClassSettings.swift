//
//  ClassSettings.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-28.
//

import SwiftUI
import SwiftData

struct ClassSettings: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var classes: [Classes]
    
    var body: some View {
        VStack {
            Text("Manage Classes")
            List {
                ForEach(classes) { subject in
                    Text(subject.name)
                }
                
                Button("Add Class")
                    AddClass()
                }
                
            }
        }
        
    }

    func addClass() {
        let item = Classes(name: "New Class", colorString: "blue")
        context.insert(item)
    }
    
}

#Preview {
    ClassSettings()
}
