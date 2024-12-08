//
//  DonationPromo.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-29.
//

import SwiftUI

struct DonationPromo: View {
    @State private var showDonationSelection = false // State to manage modal presentation

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.purple]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .cornerRadius(20)

            HStack {
                VStack(alignment: .leading) {
                    Text("Support My Work")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("App Store Fees Are $100/yr")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding()

                Spacer()

                Button(action: {
                    showDonationSelection = true
                }) {
                    Text("Donate")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                }
                .padding()
                .sheet(isPresented: $showDonationSelection) {
                    DonationSelectionView() // Modal presentation
                }
            }
        }
        .frame(height: 70)
        //.padding(.horizontal)
    }
}

#Preview {
    DonationPromo()
}

