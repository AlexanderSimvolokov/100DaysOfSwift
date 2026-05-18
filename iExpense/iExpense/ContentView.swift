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
    
    var body: some View {
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
        }
    }
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
