//
//  AppertizerListView.swift
//  Exercise4
//
//  Created by Khue on 29/12/25.
//

import SwiftUI

struct AppertizerListView: View {
    @StateObject private var viewModel = AppertizerListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.appertizers) { appetizer in
                AppertizerListCell(appertizer: appetizer)
                    .frame(height: 100)
            }
            .listStyle(.plain)
            .navigationTitle("Appertizers")
        }
        .onAppear { // Tương tự viewWillAppear
            viewModel.getAppertizers()
        }
    }
}

struct AppertizerListCell: View {
    let appertizer: Appertizer
    
    var body: some View {
        HStack(spacing: 16) {
            Image("cat2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120)
                .cornerRadius(16)
            
            VStack(alignment: .leading) {
                Text(appertizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(2)
                Text("$\(appertizer.price, specifier: "%.2f")")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.gray)
            }
        }
    }
}


#Preview {
    AppertizerListView()
}
