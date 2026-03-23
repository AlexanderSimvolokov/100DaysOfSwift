//
//  ContentView.swift
//  Rock-Paper-Scissors
//
//  Created by Alexander Simvolokov on 22.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State var youChose = "?"
    @State var opponentChose = "?"
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack(spacing: 0) {
                playerSection(isTop: true)
                    .rotationEffect(.degrees(180))
                    .background(.blue)
                playerSection(isTop: false)
                    .background(.green)
            }
        }
    }
    
    @ViewBuilder
    private func playerSection(isTop: Bool) -> some View {
        VStack(spacing: 0) {
            VStack {
                Text(isTop ? "Противник выбрал" : "Вы выбрали")
                    .font(.title2)
                Text(isTop ? opponentChose : youChose)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(isTop ? Color.blue.opacity(0.2) : Color.green.opacity(0.2))
            
            HStack(spacing: 4) {
                ForEach(["Rock", "Paper", "Scissors"], id: \.self) { choice in
                    Text(choice)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.ultraThinMaterial)
                        .border(Color.black, width: 1)
                        .onTapGesture {
                            print("\(choice) tapped by \(isTop ? "opponent" : "you")")
                            if isTop {
                                opponentChose = choice
                            } else {
                                youChose = choice
                            }
                        }
                }
            }
            .frame(maxHeight: 120)
            
            Spacer()
            
            Button {
                
            } label: {
                Text(isTop ? "Выбрать" : "Выбрать")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.yellow)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                    .background(.blue.gradient)
                    .clipShape(.capsule(style: .continuous))
                    .shadow(radius: 4)
            }
            
            Spacer(minLength: 40)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
