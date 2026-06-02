//
//  ContentView.swift
//  Moonshot-v2
//
//  Created by Alexander Simvolokov on 31.05.2026.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        Text(String(astronauts.count))
        VStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding([.horizontal, .bottom])
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .padding()
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                )
                                
                            }
                            .padding()
                        }
                    }
                }
                .navigationTitle("Moonshot")
            }
        }
    }
}

#Preview {
    ContentView()
}
