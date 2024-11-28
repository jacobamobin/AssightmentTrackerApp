//
//  Search.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI

struct Search: View {
    
    @State private var searchText: String = ""
    @State private var showExpired: Bool = false
    
    var body: some View {
        
        // Search Bar
        TextField("Search...", text: $searchText)
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 7)
        
        ClassSelector()
        
        // Toggle for "Show Expired"
        Toggle(isOn: $showExpired) {
            Text("Show Finished")
                .font(.body)
        }
        .padding(.horizontal)
        
        Spacer()
    }
}

#Preview {
    Search()
}
