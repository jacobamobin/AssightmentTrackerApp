//
//  EventAdderMic.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-12-05.
//

import SwiftUI

struct EventAdderMic: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: UIScreen.main.bounds.width-10, height: UIScreen.main.bounds.height-10)
                .foregroundStyle(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [.blue, .red]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                                , lineWidth: 17)
                        .padding(.bottom, 15)
                        .padding(.top, -15)
                )
            
        }
    }
    
    
}

#Preview {
    EventAdderMic()
}
