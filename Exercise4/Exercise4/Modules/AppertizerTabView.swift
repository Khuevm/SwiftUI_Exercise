//
//  TabView.swift
//  Exercise4
//
//  Created by Khue on 29/12/25.
//

import SwiftUI

struct AppertizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppertizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
        }
    }
}

//#Preview {
//    AppertizerTabView()
//}
