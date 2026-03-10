//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Alexander Simvolokov on 09.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        HStack {
            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            
            LinearGradient(stops: [
                Gradient.Stop(color: .white, location: 0.45),
                Gradient.Stop(color: .black, location: 0.55),
            ], startPoint: .top, endPoint: .bottom)
            
            LinearGradient(stops: [
                .init(color: .white, location: 0.45),
                .init(color: .black, location: 0.55),
            ], startPoint: .top, endPoint: .bottom)
        }
        HStack {
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            ZStack {
                VStack(spacing: 0) {
                    Color.red
                    Color.blue
                }
                
                Text("Your content")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.white)
                    .background(.red.gradient)
            }
        }
        .ignoresSafeArea()
        
        HStack{
            Button("Delete selection", action: executeDelete)
            Button("Delete selection", role: .destructive, action: executeDelete)
        }
        HStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
        }
        
        HStack {
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }
            
            Button("Edit", systemImage: "pencil") {
                print("Edit button was tapped")
            }
            
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
        HStack {
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please read this.")
            }
        }
    }
}

func executeDelete() {
    print("Now deleting…")
}

#Preview {
    ContentView()
}
