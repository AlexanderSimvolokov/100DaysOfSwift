//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Alexander Simvolokov on 15.06.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var habits = Habits()
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (habits.habits) { habit in
                    NavigationLink(value: habit) {
                        VStack {
                            Text(habit.name)
                            Text(String(habit.completedCount))
                        }
                    }
                }
                .onDelete(perform: habits.remove)
            }
            .navigationTitle("Habits")
            .toolbar {
                Button {
                    showingAddSheet.toggle()
                } label: {
                    Label("add", systemImage: "plus")
                }
               
            }
            .navigationDestination(for: Habit.self) { habit in
                HabitView(habit: habit, habits: habits)
            }
            
        }
        .sheet(isPresented: $showingAddSheet)
        {
            HabitAddView(habits: habits)
        }
    }
}

#Preview {
    ContentView()
}
