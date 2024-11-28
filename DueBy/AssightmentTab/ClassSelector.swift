//
//  ClassSelector.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI

struct ClassSelector: View {
    var classes: [String: Color] = [
        "MTH110": .blue,
        "CPS213": .green,
        "CPS109": .yellow,
        "PCS110": .purple,
        "DST300": .brown
    ]
    @State private var selectedClass: String?

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(classes.keys.sorted(), id: \.self) { className in
                    Button {
                        if selectedClass == className {
                            selectedClass = nil
                        } else {
                            selectedClass = className
                        }
                    } label: {
                        Text(className)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(selectedClass == className ? (classes[className] ?? .gray) : .gray.opacity(0.7))
                            )
                    }
                }
            }
            .padding(.horizontal)
        }.scrollIndicators(.hidden)
    }
}


#Preview {
    ClassSelector()
}
