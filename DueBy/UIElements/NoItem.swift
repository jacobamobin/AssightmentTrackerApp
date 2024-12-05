//
//  NoItem.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-12-05.
//

import SwiftUI

struct NoItem: View {
    
    @State private var selectedClass: String? = nil
    
    var body: some View {
        VStack {
            NavigationLink(destination: Search(selectedClass: $selectedClass)) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 8)
            }
            
            Text("No Assignments")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            
            Text("To search completed work, Click the Search icon")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(.systemGray6))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
        .padding()
    }
}

#Preview {
    NoItem()
}
