//
//  ContentView.swift
//  Navigation-v3
//
//  Created by Alexander Simvolokov on 09.06.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action here
                        }
                        
                        Button("Tap Me 2") {
                            // button action here
                        }
                    }
                }
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
