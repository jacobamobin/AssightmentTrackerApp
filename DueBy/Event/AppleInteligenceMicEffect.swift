//
//  AppleInteligenceMicEffect.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-12-05.
//

import SwiftUI

struct AppleInteligenceMicEffect: View {
    @Bindable private var controller = ComplexWaveController()
    private let date = Date()
    
    var body: some View {
        ZStack {
            //Glow() // Ensure Glow is on top
            
            TimelineView(.animation) { context in
                let time = context.date.timeIntervalSince1970 - date.timeIntervalSince1970
                
                Glow()
                    .modifier(ComplexWaveModifierVFX(
                        controller: controller,
                        time: time
                    ))
            }
        }
    }

    
    @Observable
    fileprivate class ComplexWaveController {
        var speed: CGFloat = 10
        var frequency: CGFloat = 10
        var strength: CGFloat = 10
    }
    
    private struct ComplexWaveModifierVFX: ViewModifier {
        @Bindable var controller: ComplexWaveController
        var time: CGFloat
        
        func body(content: Content) -> some View {
             content
                .visualEffect { content, proxy in
                    content
                        .distortionEffect(
                            ShaderLibrary.ComplexWave(
                                .float(time),
                                .float(controller.speed),
                                .float(controller.frequency),
                                .float(controller.strength),
                                .float2(proxy.size)
                            ),
                            maxSampleOffset: .zero
                        )
                }
        }
    }
    
}

struct Glow: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height - 10)
                .foregroundStyle(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [.blue, .red]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 17
                        )
                        .padding(.bottom, 15)
                        .padding(.top, -15)
                )
        }
    }

}
#Preview {
    AppleInteligenceMicEffect()
}




