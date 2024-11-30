//
//  HomeHeader.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI

struct HomeHeader: View {
    
    @Binding var selectedClass: String?
    
    var body: some View {
            VStack(spacing: 20) {
                HStack {
                    Text("Assightments")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: Search(selectedClass: $selectedClass)) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    
                    
                }
                .padding(.horizontal)
                
            }
            
        
    }
        
}

#Preview {
    HomeHeader(selectedClass: .constant("MTH110"))
}
