//
//  Habits.swift
//  Habit Tracker
//
//  Created by Alexander Simvolokov on 16.06.2026.
//

import Foundation
import Observation
import SwiftUI

@Observable
class Habits {
    var habits: [Habit] = []
    
    private let saveKey = "habits"
    
    init() {
        loadHabits()
    }
    
    func add(_ habit: Habit) {
        habits.append(habit)
        saveHabits()
    }
    
    func remove(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
        saveHabits()
    }
    
    func incrementCount(for habit: Habit) {
        if let index = habits.firstIndex(of: habit) {
            habits[index].completedCount += 1
            saveHabits()
        }
    }
    
    func saveHabits() {
        if let encoded = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadHabits() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: data) {
                habits = decoded
            }
        }
    }
}
