//
//  ContentView.swift
//  Navigation
//
//  Created by Alexander Simvolokov on 04.06.2026.
//

import SwiftUI

struct DetailView: View {
    var number: Int

    @Binding var path441: NavigationPath
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path441 = NavigationPath()
                }
            }
        
    }
    
}

struct ContentView: View {
    
    @State private var path = [Int]()
    
    @State private var path441 = NavigationPath()
    
    //day44
    @State private var path44 = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }

                Button("Show 64") {
                    path.append(64)
                }
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
        //day44
        NavigationStack(path: $path44) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }

                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 556") {
                    path44.append(556)
                }

                Button("Push Hello") {
                    path44.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
//        441
        NavigationStack(path: $path441) {
            DetailView(number: 0, pass: $path441)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, pass: $path441)
                }
        }
    }
}

#Preview {
    ContentView()
}
