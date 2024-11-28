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
    var color: Color
    
    init(name: String, color: Color) {
        
        self.id = UUID().uuidString
        self.name = name
        self.color = color
        
    }
}
