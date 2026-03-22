//
//  ContentView.swift
//  Rock-Paper-Scissors
//
//  Created by Alexander Simvolokov on 22.03.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.blue)
                
                VStack(spacing: 0) {
                    VStack {
                        Text("You chose")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.brown)
                    HStack(spacing: 3) {
                        Text("2.1")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .border(Color.black)
                        Text("2.2")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .border(Color.black)
                        Text("2.3")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .border(Color.black)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.yellow)
                    VStack {
                        Text("3")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.green)
            }
        }
    }
}

#Preview {
    ContentView()
}
