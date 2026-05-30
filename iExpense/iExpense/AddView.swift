//
//  AddView.swift
//  iExpense
//
//  Created by Alexander Simvolokov on 29.05.2026.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    var expenses: Expenses
    
    var amountFont: Font {
        if amount <= 10 {
            return .title
        } else if amount < 40 {
            return .title2          // или .title3 — чуть больше .title
        } else {
            return .largeTitle
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .font(amountFont)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
