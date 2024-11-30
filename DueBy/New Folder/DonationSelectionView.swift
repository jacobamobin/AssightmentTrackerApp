//
//  DonationSelectionView.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-29.
//

import SwiftUI

struct DonationSelectionView: View {
    @Environment(\.dismiss) var dismiss // Dismiss environment variable
    
    var body: some View {
        VStack(spacing: 20) {
            // Title and description
            Text("Select Donation")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
            
            Text("The donation promo at the bottom of the screen will dissapear forever from the home screen after you make a donation.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            // Donation options
            HStack(spacing: 20) {
                DonationButton(amount: "$2")
                DonationButton(amount: "$5")
                DonationButton(amount: "$10")
            }
            
            Spacer()
            
            // Close button
            Button(action: {
                dismiss()
            }) {
                Text("Close")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.bottom, 40)
        }
        .padding()
    }
}

struct DonationButton: View {
    let amount: String
    
    var body: some View {
        Button(action: {
            // Handle donation logic
        }) {
            Text(amount)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.green, Color.blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
        }
    }
}

#Preview {
    DonationSelectionView()
}

