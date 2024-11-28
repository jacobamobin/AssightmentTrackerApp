//
//  DueByApp.swift
//  DueBy
//
//  Created by Jacob Mobin on 2024-11-27.
//

import SwiftUI
import SwiftData

@main
struct DueByApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Event.self)
    }
}
