//
//  Event.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Event: Identifiable {
    
    var id: String
    var name: String
    
    init(name: String) {
        
        self.id = UUID().uuidString
        self.name = name
    }
    
}


