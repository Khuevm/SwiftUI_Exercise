//
//  SwiftDataExerciseApp.swift
//  SwiftDataExercise
//
//  Created by Khue on 12/1/26.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExerciseApp: App {
    let container = {
        let schema = Schema([Expense.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            ExpenseListView()
        }.modelContainer(container)
    }
}
