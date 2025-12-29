//
//  Appertizer.swift
//  Exercise4
//
//  Created by Khue on 29/12/25.
//

struct Appertizer: Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    
    let calories: Double
    let protein: Double
    let carbs: Double
}
