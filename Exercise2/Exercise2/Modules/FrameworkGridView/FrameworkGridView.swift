//
//  FrameworkGridView.swift
//  Exercise2
//
//  Created by Khue on 8/12/25.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridVM()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkGridCellView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                                viewModel.isShowDetailView = true
                            }
                    }
                }
                .padding(8)
            }
            .navigationTitle("🍎 Framework")
            .sheet(isPresented: $viewModel.isShowDetailView) {
                if let selectedFramework = viewModel.selectedFramework {
                    FrameworkDetailView(viewModel:
                                            FrameworkDetailViewModel(framework: selectedFramework,
                                                                     isShowDetailView: $viewModel.isShowDetailView)
                    )
                }
            }
        }
    }
}

struct FrameworkGridCellView: View {
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                
            Text(framework.name)
                .font(.system(.title2))
                .lineLimit(2)
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.center)
                
        }
    }
}


#Preview {
    FrameworkGridView()
}
