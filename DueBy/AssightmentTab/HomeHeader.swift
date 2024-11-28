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
            // Header
            
            Text("Assightments")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            
            
            Spacer() // Pushes content to the top
        }
        .padding(.top, 20)
    }
        
}

#Preview {
    HomeHeader()
}
