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
            if viewModel.isLoading {
                ActivityIndicator()
            } else {
                ZStack {
                    List(viewModel.appertizers) { appetizer in
                        AppertizerListCell(appertizer: appetizer)
                            .frame(height: 100)
                            .onTapGesture {
                                viewModel.selectedAppertizer = appetizer
                                viewModel.isShowingDetailView = true
                            }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Appertizers")
//                    .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
//                    .scrollDisabled(viewModel.isShowingDetailView)
                    
                    if viewModel.isShowingDetailView {
                        Color.clear
                                .background(.ultraThinMaterial)
                                .ignoresSafeArea()
                        AppertizerDetailView(appertizer: viewModel.selectedAppertizer!, isShowingDetailView: $viewModel.isShowingDetailView)
                    }
                }
            }
        }
        .onAppear { // Tương tự viewWillAppear
            viewModel.getAppertizers()
        }
        .alert(
            viewModel.alertItem?.title ?? "",
            isPresented: Binding(
                get: { viewModel.alertItem != nil },
                set: { if !$0 { viewModel.alertItem = nil } }
            ),
            presenting: viewModel.alertItem
        ) { alert in
            Button(alert.dismissButton, role: .cancel) {}
        } message: { alert in
            Text(alert.desc)
        }
    }
}

struct AppertizerListCell: View {
    let appertizer: Appertizer
    @StateObject private var viewModel = ImageLoaderViewModel()
    
    var body: some View {
        HStack(spacing: 16) {
            Image(uiImage: viewModel.image ?? UIImage(named: "img_food_placeholder")!)
                .resizable()
                .scaledToFill()
                .frame(width: 120)
                .cornerRadius(16)
                .clipped()
                .onAppear {
                    viewModel.downloadImage(urlString: appertizer.imageURL)
                }
            
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

//
//#Preview {
//    AppertizerListView()
//}
