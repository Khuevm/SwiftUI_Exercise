//
//  Exercise4App.swift
//  Exercise4
//
//  Created by Khue on 29/12/25.
//

import SwiftUI

@main
struct Exercise4App: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppertizerTabView().environmentObject(order)
        }
    }
}
