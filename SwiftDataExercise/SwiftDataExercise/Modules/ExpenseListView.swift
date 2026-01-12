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
    
    @State var isShowingAddExpenseView = false
    @Query(sort: \Expense.date) var expenses: [Expense]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .frame(height: 50)
//                        .onTapGesture {
//                            isShowingAddExpenseView = true
//                        }.navigationDestination(isPresented: $isShowingAddExpenseView) {
//                            AddExpenseView(expense: expense)
//                        }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(expenses[index])
                    }
                }
            }
            .toolbar(content: {
                if !expenses.isEmpty {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("", systemImage: "plus") {
                            isShowingAddExpenseView = true
                        }.navigationDestination(isPresented: $isShowingAddExpenseView) {
                            AddExpenseView()
                        }
                    }
                }
            })
            .navigationTitle("Expenses")
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    } description: {
                        Text("Start adding expense to see your list")
                    } actions: {
                        Button("Add Expense") {
                            isShowingAddExpenseView = true
                        }.navigationDestination(isPresented: $isShowingAddExpenseView) {
                            AddExpenseView()
                        }
                    }
                }
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
