//
//  Search.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI

struct Search: View {
    
    @Binding var selectedClass: String?
    
    @State public var searchText: String = ""
    @State public var showExpired: Bool = false
    
    var body: some View {
        
        // Search Bar
        TextField("Search...", text: $searchText)
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.vertical, 7)
        
        ClassSelector(selectedClass: $selectedClass)
        
        // Toggle for "Show Expired"
        Toggle(isOn: $showExpired) {
            Text("Show Completed Work")
                .font(.body)
        }
        .padding(.horizontal)
        
        Spacer()
    }
}

#Preview {
    Search(selectedClass: .constant("MTH110"))
}
