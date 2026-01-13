//
//  ExpenseListView.swift
//  SwiftDataExercise
//
//  Created by Khue on 12/1/26.
//

import SwiftUI
import SwiftData

struct ExpenseListView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \Expense.date, order: .reverse) var expenses: [Expense]
    
    @State var isShowingAddExpenseView = false
    @State private var selectedExpense: Expense?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .frame(height: 50)
                        .onTapGesture {
                            selectedExpense = expense
                            isShowingAddExpenseView = true
                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(expenses[index])
                    }
                }
            }
            .toolbar {
                if !expenses.isEmpty {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("", systemImage: "plus") {
                            selectedExpense = nil
                            isShowingAddExpenseView = true
                        }
                    }
                }
            }
            .navigationTitle("Expenses")
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    } description: {
                        Text("Start adding expense to see your list")
                    } actions: {
                        Button("Add Expense") {
                            selectedExpense = nil
                            isShowingAddExpenseView = true
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $isShowingAddExpenseView) {
                AddExpenseView(expense: selectedExpense)
            }
        }
    }
}

struct ExpenseCell: View {
    let expense: Expense
    
    var body: some View {
        HStack {
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                .multilineTextAlignment(.leading)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 80)
            Text(expense.name)
                .lineLimit(2)
            Spacer()
            Text(expense.price, format: .currency(code: "USD"))
        }
    }
}


#Preview {
    ExpenseListView()
}
