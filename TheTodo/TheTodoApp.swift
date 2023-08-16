//
//  TheTodoApp.swift
//  TheTodo
//
//  Created by T Krobot on 14/8/23.
//

import SwiftUI

@main
struct TheTodoApp: App {
    @StateObject private var settings = GameSettings()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
