//
//  OrderView.swift
//  Exercise4
//
//  Created by Khue on 29/12/25.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(order.items) { item in
                        AppertizerListCell(appertizer: item)
                            .frame(height: 100)
                    }
                    .onDelete { indexSet in
                        order.deleteAtIndexSet(at: indexSet)
                    }
                }
                
                if order.items.isEmpty {
                    EmptyStateView(imageName: "img_empty_order", desc: "You have no order.\nPlease add an appertizer")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Order")
            .overlay(alignment: .bottom) {
                Button {
                    //
                } label: {
                    Text("$\(order.totalPrice, specifier: "%.2f") - Add to Order")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.accent)
                        .cornerRadius(8)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    OrderView()
}
