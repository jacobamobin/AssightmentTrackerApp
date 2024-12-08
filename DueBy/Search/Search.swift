//
//  Search.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI

struct Search: View {
    var events: [Event]
    var classes: [Classes]

    @Binding var selectedClass: String?

    @State private var searchText: String = ""
    @State private var showExpired: Bool = false

    var body: some View {
        VStack {
            // Search Bar
            TextField("Search...", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.vertical, 7)

            // Class Selector
            ClassSelector(selectedClass: $selectedClass)

            // Toggle for "Show Expired"
            Toggle(isOn: $showExpired) {
                Text("Show Completed Work")
                    .font(.body)
            }
            .padding(.horizontal)

            // Scrolling Section
            SearchScrollingSection(
                events: events,
                classes: classes,
                selectedClass: $selectedClass,
                showExpired: $showExpired
            )

            Spacer()
        }
    }
}

