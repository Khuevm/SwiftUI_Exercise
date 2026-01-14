//
//  CategoryView.swift
//  Todoey-SwiftData
//
//  Created by Khue on 13/1/26.
//

import SwiftData
import SwiftUI

struct CategoryView: View {
    @Environment(\.modelContext) var context
    @Query private var categories: [Category]
    @State private var addAlert: TextFieldAlert?

    @State private var selectedCategory: Category?

    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { cate in
                    Button(cate.name) {
                        selectedCategory = cate
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(categories[index])
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Todoey")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        addAlert = TextFieldAlert(
                            title: "Add New Category",
                            message: "",
                            placeholder: "Enter name..."
                        ) { text in
                            let cate = Category(name: text)
                            context.insert(cate)
                        }
                    }
                    .tint(Color.accentColor)
                }
            }
            .background(
                TextFieldAlertVC(alert: $addAlert)
            )
            .navigationDestination(item: $selectedCategory) { cate in
                TodoView(category: cate)
            }
        }
    }
}

#Preview {
    CategoryView()
}
