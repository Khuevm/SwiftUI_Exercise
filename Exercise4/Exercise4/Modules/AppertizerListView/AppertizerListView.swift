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
//                ActivityIndicator()
                // Other way
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
                    .tint(.accent)
                    
            } else {
                ZStack {
                    List(viewModel.appertizers) { appetizer in
                        AppertizerListCell(appertizer: appetizer)
                            .frame(height: 100)
                            .listRowSeparator(.hidden)
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
//        .onAppear { // Tương tự viewWillAppear
//            viewModel.getAppertizers()
//        }
        .task { // Tương tự viewWillAppear dùng async
            viewModel.getAppertizers2()
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

//
//#Preview {
//    AppertizerListView()
//}
