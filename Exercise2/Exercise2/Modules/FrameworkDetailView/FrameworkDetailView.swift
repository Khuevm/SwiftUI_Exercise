//
//  FrameworkDetailView.swift
//  Exercise2
//
//  Created by Khue on 8/12/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    viewModel.isShowDetailView.wrappedValue = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .frame(width: 40, height: 40)
                }
            }
            Spacer()
            Image(viewModel.framework.imageName)
                .resizable()
                .frame(width: 100, height: 100)
            Text(viewModel.framework.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                
            Text(viewModel.framework.desc)
                .multilineTextAlignment(.center)
            Spacer()
            
            Link(destination: URL(string: viewModel.framework.urlString)!) {
                Text("Learn More")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.red)
                    .cornerRadius(8)
            }

        }
        .padding()
    }
}
