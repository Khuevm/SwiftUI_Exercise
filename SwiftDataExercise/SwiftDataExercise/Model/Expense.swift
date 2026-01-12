//
//  Expense.swift
//  SwiftDataExercise
//
//  Created by Khue on 12/1/26.
//

import Foundation
import SwiftData

@Model
class Expense {
    @Attribute(.unique) var uid = UUID().uuidString
    var date = Date()
    var name: String = ""
    var price: Double = 0
    
    init(date: Date, name: String, price: Double) {
        self.date = date
        self.name = name
        self.price = price
    }
    
    init() {}
}
