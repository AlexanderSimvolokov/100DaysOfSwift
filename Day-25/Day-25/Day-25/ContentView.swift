//
//  ContentView.swift
//  Day-25
//
//  Created by Alexander Simvolokov on 21.03.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State var agreedToTerms = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false
    
    var body: some View {
        let binding = Binding(
            get: { selection },
            set: { selection = $0 }
        )
        
        let agreedToAll = Binding(
            get: {
                agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
            },
            set: {
                agreedToTerms = $0
                agreedToPrivacyPolicy = $0
                agreedToEmails = $0
            }
        )
        
        VStack {
            Picker("Select a number", selection: binding) {
                ForEach(0..<3) {
                    Text("Item \($0)")
                }
            }
            .pickerStyle(.segmented)
        }
        
        VStack {
                    Toggle("Agree to terms", isOn: $agreedToTerms)
                    Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
                    Toggle("Agree to receive shipping emails", isOn: $agreedToEmails)
                    Toggle("Agree to all", isOn: agreedToAll)
                }
    }
}

#Preview {
    ContentView()
}
