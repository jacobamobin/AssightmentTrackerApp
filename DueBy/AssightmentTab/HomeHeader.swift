//
//  HomeHeader.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Assightments")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: Search()) {
                        Image(systemName: "magnifyingglass")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    
                    
                }
                .padding(.horizontal)
                
            }
            .padding(.top, 20)
        
    }
        
}

#Preview {
    HomeHeader()
}
