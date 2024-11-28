//
//  ClassSettings.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-28.
//

import SwiftUI
import SwiftData

struct ClassSettings: View {
    
    @Environment(\.modelContext) private var contextb
    
    @Query private var classes: [Classes]
    
    var body: some View {
        VStack {
            Button("Add Class") {
                addClass()
            }
            
            List {
                ForEach(classes) { subject in
                    Text(subject.name)
                }
            }
        }
        
    }
    
    
    func addClass() {
        let item = Classes(name: "New Class", colorString: "blue")
        contextb.insert(item)
    }
}

#Preview {
    ClassSettings()
}
