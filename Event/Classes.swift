//
//  Classes.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-28.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Classes: Identifiable {
    
    var id: String
    var name: String
    var colorHex: String // Store color as a hex string
    
    init(name: String, colorHex: String) {
        self.id = UUID().uuidString
        self.name = name
        self.colorHex = colorHex
    }
    
    // Helper to get a SwiftUI Color from the hex string
    func getColor() -> Color {
        return Color(hex: colorHex) ?? .white // Default to white if conversion fails
    }
    
    // Helper to set the hex color using a SwiftUI Color
    func setColor(_ color: Color) {
        self.colorHex = color.toHex() ?? "#FFFFFF" // Default to white if conversion fails
    }
}


