//
//  AccountViewModel.swift
//  Exercise4
//
//  Created by Khue on 5/1/26.
//

import Combine
import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data? // User Defaults
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        if user.firstName.isEmpty || user.lastName.isEmpty || user.email.isEmpty {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        if !user.email.isValidEmail {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveUser() {
        if !isValidForm { return }
        if let data = try? JSONEncoder().encode(user) {
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } else {
            alertItem = AlertContext.userSaveError
        }
    }
    
    func getUser() {
        if let userData, let data = try? JSONDecoder().decode(User.self, from: userData) {
            self.user = data
        }
    }
}

