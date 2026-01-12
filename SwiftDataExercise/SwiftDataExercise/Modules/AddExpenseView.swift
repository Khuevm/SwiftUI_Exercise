//
//  AddExpenseView.swift
//  SwiftDataExercise
//
//  Created by Khue on 12/1/26.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State var expense = Expense()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.price, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
                .navigationTitle("New Expense")
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("Save") {
                            if expense.name.isEmpty || expense.price == 0 {
                                return 
                            }
                            save()
                            dismiss()
                        }
                    }
                }
        }
    }
    
    func save() {
        context.insert(expense)
    }
}

#Preview {
    AddExpenseView()
}
