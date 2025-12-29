//
//  MockData.swift
//  Exercise4
//
//  Created by Khue on 29/12/25.
//

enum MockData {
    static let sampleAppetizer = Appertizer(id: 1,
                                            name: "Test Appetizer",
                                            description: "This is the description for my appetizer. It's yummy.",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 99,
                                            protein: 99,
                                            carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appertizer(id: 2,
                                         name: "Test Appetizer One",
                                         description: "This is the description for my appetizer. It's yummy.",
                                         price: 9.99,
                                         imageURL: "",
                                         calories: 99,
                                         protein: 99,
                                         carbs: 99)
    
    static let orderItemTwo = Appertizer(id: 3,
                                         name: "Test Appetizer Two",
                                         description: "This is the description for my appetizer. It's yummy.",
                                         price: 9.99,
                                         imageURL: "",
                                         calories: 99,
                                         protein: 99,
                                         carbs: 99)
    
    static let orderItemThree = Appertizer(id: 4,
                                           name: "Test Appetizer Three",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
