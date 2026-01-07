//
//  AppertizerListCell.swift
//  Exercise4
//
//  Created by Khue on 6/1/26.
//

import SwiftUI

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
