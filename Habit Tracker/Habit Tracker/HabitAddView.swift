//
//  HabitAddView.swift
//  Habit Tracker
//
//  Created by Alexander Simvolokov on 17.06.2026.
//

import SwiftUI

struct HabitAddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let habits: Habits
    @State private var name: String = ""
    @State private var description: String = ""
        
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name habit", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("New habit")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newHabit = Habit(name: name, description: description)
                        habits.add(newHabit)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    HabitAddView(habits: Habits())
}
