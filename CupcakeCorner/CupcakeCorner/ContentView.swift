//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Alexander Simvolokov on 22.06.2026.
//

import SwiftUI

struct Result: Codable {
    var trackID: Int
    var trackName: String
    var collectionName: String
}

struct Response: Codable {
    var result: [Result]
}

struct ContentView: View {
    
    @State private var results = [Result]()
    @State private var userName: String = ""
    @State private var email: String = ""
    var disabledForm: Bool {
        userName.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("User name", text: $userName)
                TextField("Email", text: $email)
            }
            Section {
                Button("Cteate account") {
                    print("Cerating account...")
                }
            }
            .disabled(disabledForm)
//            .disabled(userName.isEmpty || email.isEmpty)
        }
        List(results, id: \.trackID) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
        List {
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.red
            }
            .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image.")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
            
        }
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=abba&entity=song") else {
            print("Invalid error")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.result
            }
            
        } catch {
            print("invalid error")
        }
    }
    
}

#Preview {
    ContentView()
}
