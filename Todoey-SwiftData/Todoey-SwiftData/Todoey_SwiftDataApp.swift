//
//  Todoey_SwiftDataApp.swift
//  Todoey-SwiftData
//
//  Created by Khue on 13/1/26.
//

import SwiftUI
import SwiftData

@main
struct Todoey_SwiftDataApp: App {
    let container = {
        let schema = Schema([Category.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        print("Data File:", container.configurations.first?.url)
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            CategoryView()
        }
        .modelContainer(container)
    }
}
