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
    @State var youMadeaChoise = false
    @State var opponentMadeaChoise = false
    @State var youCountWin = 0
    @State var opponentCountWin = 0
    
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
        .onChange(of: youMadeaChoise && opponentMadeaChoise) { isBothReady in
            if isBothReady {
                startGame()
            }
        }
    }
    
    @ViewBuilder
    private func playerSection(isTop: Bool) -> some View {
        VStack(spacing: 0) {
            VStack {
                Text("Безопасная зона")
                    .foregroundStyle(Color.black)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.yellow.opacity(0.4))
            
            ZStack {
                HStack(spacing: 0) {
                    VStack {
                        Text("Ты")
                            .border(Color.black, width: 1)
                        Text(isTop ? "\(opponentCountWin)" :"\(youCountWin)")
                        
                    }
                    .border(Color.black, width: 1)
                    VStack {
                        Text("Этот")
                            .border(Color.black, width: 1)
                        Text(isTop ? "\(youCountWin)" : "\(opponentCountWin)")
                    }
                    .border(Color.black, width: 1)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                VStack {
                    Text(isTop ? "Противник выбрал" : "Вы выбрали")
                        .font(.title2)
                    
                    Text(isTop ? opponentMadeaChoise ? "Выбор сделан" : opponentChose : youMadeaChoise ? "Выбор сделан" :youChose)
                        .font(.largeTitle)
                }
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
                choose(isTop: isTop)
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
    
    func choose(isTop: Bool) {
        if isTop {
            opponentMadeaChoise.toggle()
        } else {
            youMadeaChoise.toggle()
        }
    }
    
    func startGame() {
        if youChose == "Rock" && opponentChose == "Scissors" {
            youChose = "Вы выйграли!!!"
            opponentChose = "Вы проиграли((("
            
            youCountWin += 1
        } else if  youChose == "Rock" && opponentChose == "Paper" {
            youChose = "Вы проиграли((("
            opponentChose = "Вы выйграли!!!"
            
            opponentCountWin += 1
        } else if  youChose == "Rock" && opponentChose == "Rock" {
            youChose = "Ничья"
            opponentChose = "Ничья"
        } else if  youChose == "Paper" && opponentChose == "Rock" {
            youChose = "Вы выйграли!!!"
            opponentChose = "Вы проиграли((("
            
            youCountWin += 1
        } else if  youChose == "Paper" && opponentChose == "Scissors" {
            youChose = "Вы проиграли((("
            opponentChose = "Вы выйграли!!!"
            
            opponentCountWin += 1
        } else if  youChose == "Paper" && opponentChose == "Paper" {
            youChose = "Ничья"
            opponentChose = "Ничья"
        } else if  youChose == "Scissors" && opponentChose == "Paper" {
            youChose = "Вы выйграли!!!"
            opponentChose = "Вы проиграли((("
            
            youCountWin += 1
        } else if  youChose == "Scissors" && opponentChose == "Rock" {
            youChose = "Вы проиграли((("
            opponentChose = "Вы выйграли!!!"
            
            opponentCountWin += 1
        } else if  youChose == "Scissors" && opponentChose == "Scissors" {
            youChose = "Ничья"
            opponentChose = "Ничья"
        }
        
        youMadeaChoise.toggle()
        opponentMadeaChoise.toggle()
    }
    
}

#Preview {
    ContentView()
}
