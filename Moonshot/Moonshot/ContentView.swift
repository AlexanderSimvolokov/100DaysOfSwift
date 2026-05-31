//
//  ContentView.swift
//  Moonshot
//
//  Created by Alexander Simvolokov on 30.05.2026.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
//    ]
    
//    let layout = [
//        GridItem(.adaptive(minimum: 80)),
//    ]
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(0..<1000) {
                        Text("Item \($0)")
                    }
                }
            }
            ScrollView(.horizontal) {
                LazyHGrid(rows: layout) {
                    ForEach(0..<1000) {
                        Text("Item \($0)")
                    }
                }
            }
            
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Taylor Swift",
                    "address": {
                        "street": "555, Taylor Swift Avenue",
                        "city": "Nashville"
                    }
                }
                """
                
                let data = Data(input.utf8)
                let decoder = JSONDecoder()
                if let user = try? decoder.decode(User.self, from: data) {
                    print(user.address.street)
                }
            }
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            //.navigationTitle("SwiftUI")
            
            
            //            NavigationLink {
            //                Text("Detail View")
            //            } label: {
            //                VStack {
            //                    Text("This is the label")
            //                    Text("So is this")
            //                    Image(systemName: "face.smiling")
            //                }
            //                .font(.largeTitle)
            //            }
            
            NavigationLink("Tap Me") {
                Text("Detail View")
            }
            //.navigationTitle("SwiftUI")
            
            Image(.example)
                .resizable()
                .scaledToFit()
            //            .scaledToFill()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.5
                }
                .frame(width: 300, height: 300)
            ScrollView(.vertical) {
                LazyVStack(spacing: 10) {
                    ForEach(0..<100) {
                        CustomText("Item \($0)")
                            .font(.title)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    ContentView()
}
