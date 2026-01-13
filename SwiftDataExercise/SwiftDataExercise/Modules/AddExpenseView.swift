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
    private let editExpense: Expense?
    
    init(expense: Expense? = nil) {
        self.editExpense = expense    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $expense.name)
                DatePicker("Date", selection: $expense.date, displayedComponents: .date)
                TextField("Value", value: $expense.price, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle(editExpense == nil ? "New Expense" : "Edit Expense")
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button(editExpense == nil ? "Save" : "Update") {
                            if expense.name.isEmpty || expense.price == 0 {
                                return 
                            }
                            save()
                            dismiss()
                        }
                    }
                }
                .onAppear {
                    if let editExpense {
                        self.expense.getData(from: editExpense)
                    }
                }
        }
    }
    
    func save() {
        if let editExpense {
            editExpense.getData(from: expense)
        } else {
            context.insert(expense)
        }
    }
}

#Preview {
    AddExpenseView()
}
