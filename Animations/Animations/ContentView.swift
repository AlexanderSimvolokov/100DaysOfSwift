//
//  ContentView.swift
//  Animations
//
//  Created by Alexander Simvolokov on 26.04.2026.
//

import SwiftUI

struct ContentView: View {
    
    //    @State private var animationAmount = 1.0
    @State private var animationAmount = 0.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .onAppear {
                animationAmount = 2
            }
            //            .scaleEffect(animationAmount).blur(radius: (animationAmount - 1) * 3)
            //.animation(.default, value: animationAmount)
            //.animation(.linear, value: animationAmount)
            //            .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
            //            .animation(.easeInOut(duration: 2), value: animationAmount)
            //            .animation(
            //                .easeInOut(duration: 2)
            //                    .delay(1),
            //                value: animationAmount
            //            )
            //            .animation(
            //                .easeInOut(duration: 1)
            //                    .repeatCount(3, autoreverses: true),
            //                value: animationAmount
            //            )
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .animation(
                .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
                value: animationAmount
            )
//            VStack {
//                //                        Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//                Stepper("Scale amount", value: $animationAmount.animation(
//                    .easeInOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//                ), in: 1...10)
//                
//                Spacer()
//                
//                Button("Tap Me") {
//                    animationAmount += 1
//                }
//                .padding(40)
//                .background(.red)
//                .foregroundStyle(.white)
//                .clipShape(.circle)
//                .scaleEffect(animationAmount)
//            }
            .padding(100)
            Spacer()
            
            Button("Tap Me") {
//                withAnimation {
//                    animationAmount += 360
//                }
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        }
        .padding()
    }
    
}



#Preview {
    ContentView()
}
