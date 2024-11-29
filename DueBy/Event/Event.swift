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
    var dueDate: Date
    var className: String
    var type: Int
    var isCompleted: Bool
    
    init(name: String, dueDate: Date, type: Int, className: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.name = name
        self.dueDate = dueDate
        self.type = type
        self.className = className
        self.isCompleted = isCompleted
    }
    
}



