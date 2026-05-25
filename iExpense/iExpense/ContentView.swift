//
//  ContentView.swift
//  iExpense
//
//  Created by Alexander Simvolokov on 16.05.2026.
//

import SwiftUI
import Observation

struct ContentView: View {
    
    @State private var user = User()
    
    @State private var showingSheet = false
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    @State private var user1 = User1(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName).")
                
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
                
                Button("Show Sheet") {
                    // show the sheet
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    // contents of the sheet
                    SecondView(name: "@ASimvolokov")
                }
                
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
//                    UserDefaults.standard.set(tapCount, forKey: "Tap")
                }
                
                Button("Save User") {
                    let encoder = JSONEncoder()

                    if let data = try? encoder.encode(user1) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
}

struct User1: Codable {
    let firstName: String
    let lastName: String
}

struct SecondView: View {
    
    let name: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Second View")
        Text("Hello, \(name)!")
        
        Button("Dismiss") {
            dismiss()
        }
    }
}

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

#Preview {
    ContentView()
}
