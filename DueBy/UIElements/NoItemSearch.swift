//
//  NoItemSearch.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-12-08.
//

import SwiftUI

struct NoItemSearch: View {
    
    @State private var selectedClass: String? = nil
    
    var body: some View {
        VStack {
            
            Image(systemName: "folder.badge.questionmark")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.secondary)
                .padding(.bottom, 8)
            
            
            Text("No Assignments")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            
            Text("Try a Different Filter")
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
        .padding(5)
    }
}

#Preview {
    NoItemSearch()
}

