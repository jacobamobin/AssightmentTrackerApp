//
//  AddButton.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-28.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            // Gradient circular background
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.pink, Color.orange],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                //.shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                .frame(width: 60, height: 60)
            
            // Plus icon
            Image(systemName: "plus")
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 2, y: 2)
        }
        .padding()
    }
}


#Preview {
    AddButton()
}
