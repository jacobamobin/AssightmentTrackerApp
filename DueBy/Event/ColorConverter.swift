//
//  ColorConverter.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-28.
//

import Foundation
import SwiftUI
import SwiftData

func convertColorString(_ colorString: String) -> Color {
    switch colorString.lowercased() {
    case "red":
        return .red
    case "orange":
        return .orange
    case "yellow":
        return .yellow
    case "green":
        return .green
    case "teal":
        return .teal
    case "blue":
        return .blue
    case "indigo":
        return .indigo
    case "purple":
        return .purple
    case "pink":
        return .pink
    case "gray", "grey":
        return .gray
    default:
        return .gray // Default color
    }
}
