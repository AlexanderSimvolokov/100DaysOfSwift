//
//  Bookworm_2App.swift
//  Bookworm 2
//
//  Created by Alexander Simvolokov on 13.08.2026.
//

import SwiftUI
import SwiftData

@main
struct Bookworm_2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
