//
//  DonationPromo.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-29.
//

import SwiftUI

struct DonationPromo: View {
    var body: some View {
        ZStack {
            // Background with rounded corners
            RoundedRectangle(cornerRadius: 22)
                .foregroundStyle(.blue.opacity(0.15))
                .frame(height: 130)
                .shadow(radius: 10, x: 5, y: 5)
            
            VStack(spacing: 10) {
                // Upper section with text, ensuring spacing and alignment
                VStack(alignment: .leading, spacing: 5) {
                    Text("Support This App")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                    
                    Text("Apple Developer costs $100/year")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                    Text("Help keep this free app on the app store")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 15)
                .padding(.leading, -80)
                
                Spacer()
                
                // Lower section with the PayPal logo and donate button
                HStack {
                    Spacer()
                    
                    // PayPal link section with the "donate" text and PayPal logo
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(LinearGradient(
                                colors: [.blue.opacity(0.4), .blue.opacity(0.6)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: 125, height: 45)
                            .shadow(radius: 5, x: 3, y: 3)
                        
                        HStack {
                            // PayPal logo (circle with PayPal branding)
                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                Image("PaypalLogo")  // Ensure this image is added to your assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .mask(Circle())
                            }
                            
                            // Donate text
                            Text("Donate")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing, 15)
                    .padding(.bottom, 15)
                }
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .frame(height: 130)
    }
}

#Preview {
    DonationPromo()
}

