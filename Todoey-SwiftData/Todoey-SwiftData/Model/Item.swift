//
//  Item.swift
//  Todoey-SwiftData
//
//  Created by Khue on 14/1/26.
//

import Foundation
import SwiftData

@Model
class Item {
    var id: String = UUID().uuidString
    var name: String
    var isDone: Bool = false
    
    @Relationship
    var category: Category?
    
    init(name: String, category: Category?) {
        self.name = name
        self.category = category
    }
}
