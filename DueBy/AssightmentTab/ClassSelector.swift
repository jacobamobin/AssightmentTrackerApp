//
//  ClassSelector.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI

struct ClassSelector: View {
    
    var classes: [String] = ["MTH110", "CPS213", "CPS109", "PCS110", "DST300"]
    @State private var selectedClass: String?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(classes, id: \.self) { `class` in
                    Button {
                        selectedClass = `class`
                    } label: {
                        Text(`class`)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.red)
                            )
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
    ClassSelector()
}
