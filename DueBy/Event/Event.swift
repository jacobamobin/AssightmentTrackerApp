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
    // Make attributes optional or provide defaults
    var id: String
    var name: String
    var dueDate: Date
    var className: String
    var type: Int
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, name: String = "", dueDate: Date = Date(), className: String = "", type: Int = 0, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.dueDate = dueDate
        self.className = className
        self.type = type
        self.isCompleted = isCompleted
    }
}



