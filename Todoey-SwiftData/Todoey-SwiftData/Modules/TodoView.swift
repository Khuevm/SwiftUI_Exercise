//
//  TodoView.swift
//  Todoey-SwiftData
//
//  Created by Khue on 14/1/26.
//

import SwiftUI
import SwiftData

struct TodoView: View {
    @Environment(\.modelContext) var context
    
    @State private var addAlert: TextFieldAlert?
    @State private var searchText: String = ""
    
    @Query private var items: [Item]
    private let category: Category
    private var filteredItems: [Item] {
        if searchText.isEmpty {
            return items
        }

        return items.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    
    init(category: Category) {
        self.category = category
        // cấu hình wrapper
        let categoryUID = category.uid
        _items = Query(filter: #Predicate<Item> {
            $0.category?.uid == categoryUID
        })
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredItems) { item in
                    Button {
                        item.isDone.toggle()
                    } label: {
                        TodoCell(item: item)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(items[index])
                    }
                }
            }
            .listStyle(.plain)
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search item..."
            )
            .navigationTitle(category.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        addAlert = TextFieldAlert(
                                title: "Add New Todo Item",
                                message: "",
                                placeholder: "Enter name..."
                            ) { text in
                                let item = Item(name: text, category: category)
                                context.insert(item)
                            }
                    }
                    .tint(Color.accentColor)
                }
            }
            .background(
                TextFieldAlertVC(alert: $addAlert)
            )
        }
    }
}

struct TodoCell: View {
    let item: Item
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Image(systemName: "checkmark")
                .foregroundStyle(Color.accentColor)
                .frame(width: 28, height: 28)
                .opacity(item.isDone ? 1 : 0)
        }
    }
}

#Preview {
    TodoView(category: Category(name: "Hihi"))
}
