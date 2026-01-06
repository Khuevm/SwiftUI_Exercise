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
    
    static let invalidForm = AlertItem(title: "Invalid form", desc: "Please ensure all fields in the form have been filled out", dismissButton: "Ok")
    static let invalidEmail = AlertItem(title: "Invalid email", desc: "Please ensure your email is correct", dismissButton: "Ok")
    static let userSaveSuccess = AlertItem(title: "Saved Success", desc: "Your user information was successfully saved", dismissButton: "Ok")
    static let userSaveError = AlertItem(title: "Cannot saved", desc: "There was an error saving profile. Please try again", dismissButton: "Ok")
}
