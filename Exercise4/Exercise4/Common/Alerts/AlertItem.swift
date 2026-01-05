//
//  AlertItem.swift
//  Exercise4
//
//  Created by Khue on 31/12/25.
//

import Foundation

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let desc: String
    let dismissButton: String
}

struct AlertContext {
    static let networkError = AlertItem(title: "Server Error", desc: "There was an issue connecting to server. Please try again", dismissButton: "Ok")
    static let networkNoData = AlertItem(title: "No data", desc: "The data received from the server was invalid. Please try again", dismissButton: "Ok")
}
