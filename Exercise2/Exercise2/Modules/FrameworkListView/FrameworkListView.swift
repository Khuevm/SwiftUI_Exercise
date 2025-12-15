//
//  FrameworkListView.swift
//  Exercise2
//
//  Created by Khue on 15/12/25.
//

import SwiftUI

struct FrameworkListView: View {
    @StateObject var viewModel = FrameworkGridVM()

    var body: some View {
        NavigationStack {
            List {
                ForEach(MockData.frameworks) { framework in
                    FrameworkListCellView(framework: framework)
                        .onTapGesture {
                            viewModel.selectedFramework = framework
                            viewModel.isShowDetailView = true
                        }
                }
            }
            .listStyle(.plain)
            .navigationTitle("🍎 Framework")
            .sheet(isPresented: $viewModel.isShowDetailView) {
                if let selectedFramework = viewModel.selectedFramework {
                    FrameworkDetailView(isShowDetailView: $viewModel.isShowDetailView,
                                        framework: selectedFramework)
                }
            }
        }
    }
}

struct FrameworkListCellView: View {
    let framework: Framework

    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)

            Text(framework.name)
                .font(.system(.title2))
                .lineLimit(2)
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    FrameworkListView()
}
