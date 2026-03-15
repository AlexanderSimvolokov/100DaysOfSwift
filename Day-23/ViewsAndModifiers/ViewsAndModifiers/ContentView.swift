//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alexander Simvolokov on 14.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var useRedText = false
    
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Hello, world!")
                    .padding()
                    .background(.red)
                    .padding()
                    .background(.blue)
                    .padding()
                    .background(.green)
                    .padding()
                    .background(.yellow)
                
                Button("Hello, world!") {
                    print(type(of: self.body))
                }
                .frame(width: 200, height: 200)
                .background(.red)
            }
            HStack {
                Button("Hello World") {
                    // flip the Boolean between true and false
                    useRedText.toggle()
                }
                .foregroundStyle(useRedText ? .red : .blue)
            }
            HStack {
                VStack {
                    Text("Gryffindor")
                        .font(.largeTitle)
                        .blur(radius: 0)
                    Text("Hufflepuff")
                    Text("Ravenclaw")
                    Text("Slytherin")
                }
                .font(.title)
                .blur(radius: 5)
                VStack {
                    motto1
                        .foregroundStyle(.red)
                    motto2
                        .foregroundStyle(.blue)
                    spells
                }
            }
            HStack(spacing: 10) {
                CapsuleText(text: "First")
                    .foregroundStyle(.white)
                CapsuleText(text: "Second")
                    .foregroundStyle(.yellow)
            }
            HStack {
                Text("Hello World")
                    .modifier(Title())
                Text("Hello World")
                    .titleStyle()
            }
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
        }
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

#Preview {
    ContentView()
}
