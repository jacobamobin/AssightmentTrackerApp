//
//  Home.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            VStack {
                HomeHeader()
                
                Stats()
                
                ClassSelector()
                
                
                
            }.padding(5)
        }
        
        
    }
}

#Preview {
    Home()
}
