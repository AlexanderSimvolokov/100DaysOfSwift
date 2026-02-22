//
//  ContentView.swift
//  UnitConverter
//
//  Created by Alexander Simvolokov on 17.02.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCategory: String = "Time"
    @State private var selectedFrom: String = "Seconds"
    @State private var selectedTo: String = "Minutes"
    @State private var fromAmount: Double = 0.0
    
    private var toAmount: Double {
        
        guard selectedCategory == "Time",
              let secondsInFrom = timeValue[selectedFrom],
              let secondsInTo = timeValue[selectedTo] else {
            return 0.0
        }
        
        return fromAmount * Double(secondsInFrom) / Double(secondsInTo)
    }
    
    let categoriesUnit = ["Temperature","Length","Time","Volume"]
    let temperature = ["Celsius","Fahrenheit","Kelvin"]
    let length = ["Meters","Kilometers","Feet","Yards","Miles"]
    let time = ["Seconds","Minutes","Hours","Days"]
    let volume = ["Milliliters","Liters","Cups","Pints","Gallons"]
    
    var units: [String] {
        switch selectedCategory {
        case "Temperature":
            return temperature
        case "Length":
            return length
        case "Time":
            return time
        case "Volume":
            return volume
        default:
            return []
        }
    }
    
    private let timeValue: [String: Double] = [
        "Seconds": 1,
        "Minutes": 60,
        "Hours":   3600,
        "Days":    86400
    ]
    
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categoriesUnit, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(.menu)
                    .onChange(of: selectedCategory) { old, newCategory in
                        if let first = units.first {
                            selectedFrom = first
                            selectedTo = first
                        }
                    }
                }
                Section(header: Text("Input")){
                    Picker("Convert from", selection: $selectedFrom) {
                        ForEach(units, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(.menu)
                    TextField("From amount", value: $fromAmount, format: .number.precision(.fractionLength(0...2)))
                        .keyboardType(.decimalPad)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .multilineTextAlignment(.trailing)
                }
                Section(header: Text("Result")) {
                    Picker("Convert to", selection: $selectedTo) {
                        ForEach(units, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(.menu)
                    Text(String(format: "%.2f", toAmount))
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
