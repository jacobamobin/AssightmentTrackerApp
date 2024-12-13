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
    var colorString: String
    
    init(id: String = UUID().uuidString, name: String = "", colorString: String = "") {
        self.id = id
        self.name = name
        self.colorString = colorString
    }
}
