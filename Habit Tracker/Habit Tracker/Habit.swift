//
//  Habit.swift
//  Habit Tracker
//
//  Created by Alexander Simvolokov on 15.06.2026.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable, Hashable {
    let id: UUID
    var name: String
    var description: String
    var completedCount: Int
    
    init(name: String, description: String) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.completedCount = 0
    }
}
