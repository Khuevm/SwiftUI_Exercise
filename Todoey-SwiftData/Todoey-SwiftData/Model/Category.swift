//
//  Category.swift
//  Todoey-SwiftData
//
//  Created by Khue on 13/1/26.
//

import Foundation
import SwiftData

@Model
class Category {
    @Attribute(.unique) var uid = UUID().uuidString
    var name: String
    
    @Relationship(deleteRule: .cascade, inverse: \Item.category)
    var items: [Item] = []
    
    init(name: String) {
        self.name = name
    }
}

