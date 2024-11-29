//
//  GithubPromo.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-29.
//

import SwiftUI

struct GithubPromo: View {
    var body: some View {
        ZStack {
            // Background with rounded corners
            RoundedRectangle(cornerRadius: 22)
                .foregroundStyle(.white.opacity(0.15))
                .frame(height: 130)
                .shadow(radius: 10, x: 5, y: 5)
            
            VStack {
                // Upper section with text
                VStack(alignment: .leading) {
                    Text("This App is Open Source")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("Check it out on GitHub")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 20)
                .padding(.leading, -110)
                
                Spacer()
                
                // Lower section with the GitHub logo and star
                HStack {
                    Spacer()
                    
                    // GitHub link section
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(LinearGradient(
                                colors: [.gray.opacity(0.4), .black.opacity(0.6)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: 220, height: 45)
                            .shadow(radius: 5, x: 3, y: 3)
                        
                        HStack {
                            // Star icon for GitHub
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .frame(width: 30, height: 30)
                            
                            // GitHub logo and user name
                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 30, height: 30)
                                Image("GithubLogo")  // Ensure this image is added to your assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                            }
                            
                            // GitHub username
                            Text("@Jacobamobin")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing, 15)
                    .padding(.bottom, 20)
                }
            }
        }
        .padding(5)
        .frame(height: 130)
    }
}

#Preview {
    GithubPromo()
}

