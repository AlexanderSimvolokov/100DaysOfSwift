//
//  HabitView.swift
//  Habit Tracker
//
//  Created by Alexander Simvolokov on 17.06.2026.
//

import SwiftUI

struct HabitView: View {
    
    let habit: Habit          // ← change back to let
    let habits: Habits
    
    var body: some View {
        VStack(spacing: 20) {
            Text(habit.name)
                .font(.largeTitle)
            Text(habit.description)
                .font(.title3)
            Text("\(habit.completedCount) times completed")
                .font(.title)
            
            Button("Mark as completed") {
                habits.incrementCount(for: habit)
            }
            .font(.title2)
            .padding()
        }
    }
}

#Preview {
    HabitView(habit: Habit(name: "test", description: "testDesc"), habits: Habits())
}
