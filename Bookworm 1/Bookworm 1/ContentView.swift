//
//  ContentView.swift
//  Bookworm 1
//
//  Created by Alexander Simvolokov on 06.08.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rememberMe: Bool = false
    
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
//            Toggle("Remember me", isOn: $rememberMe)
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On": "Off")
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors:isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

#Preview {
    ContentView()
}
