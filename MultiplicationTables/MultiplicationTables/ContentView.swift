//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by Alexander Simvolokov on 14.05.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedNumber: Int = 1
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    ForEach(1...5, id: \.self) { multiNumber in
                        Text(String(multiNumber))
                            .font(selectedNumber == multiNumber ? .largeTitle.bold() : .title2.bold())
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color(red: 0.224, green: 0.208, blue: 0.157))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(                           RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.green, lineWidth: 2)
                            )
                            .onTapGesture {
                                selectedNumber = multiNumber
                            }
                        if multiNumber != 5 {
                            Spacer()
                        }
                    }
                }
                HStack{
                    ForEach(6...10, id: \.self) { multiNumber in
                        Text(String(multiNumber))
                            .font(selectedNumber == multiNumber ? .largeTitle.bold() : .title2.bold())
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color(red: 0.224, green: 0.208, blue: 0.157))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(                           RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.green, lineWidth: 2)
                            )
                            .onTapGesture {
                                selectedNumber = multiNumber
                            }
                        if multiNumber != 10 {
                            Spacer()
                        }
                    }
                }
                Spacer()
                
                VStack(alignment: .leading, spacing: 3) {
                    ForEach(1...10, id: \.self) { singleNumber in
                        HStack {
                            Text(String(selectedNumber))
                            Text("*")
                            Text(String(singleNumber))
                            Text("=")
                            Text(String(selectedNumber * singleNumber))
                        }
                        .font(.largeTitle)
                    }
                }
                Spacer()
                
            }
            .padding()
            
            .navigationTitle("Multiplication Tables")
            .toolbarColorScheme(.dark, for: .navigationBar)
            
            .foregroundStyle(Color(.green))
            .background(Color(red: 0.157, green: 0.157, blue: 0.157))
        }
    }
}

#Preview {
    ContentView()
}
