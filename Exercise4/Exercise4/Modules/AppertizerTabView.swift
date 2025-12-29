//
//  TabView.swift
//  Exercise4
//
//  Created by Khue on 29/12/25.
//

import SwiftUI

struct AppertizerTabView: View {
    var body: some View {
        TabView {
            AppertizerListView()
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(systemName: "house")
                    }
                }
            OrderView()
                .tabItem {
                    Label {
                        Text("Order")
                    } icon: {
                        Image(systemName: "bag")
                    }
                }
            AccountView()
                .tabItem {
                    Label {
                        Text("Account")
                    } icon: {
                        Image(systemName: "person")
                    }
                }
        }
    }
}

#Preview {
    AppertizerTabView()
}
