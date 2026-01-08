//
//  AppertizerDetailView.swift
//  Exercise4
//
//  Created by Khue on 5/1/26.
//

import SwiftUI

struct AppertizerDetailView: View {
    let appertizer: Appertizer
    @Binding var isShowingDetailView: Bool
    @EnvironmentObject var order: Order
    
    @StateObject private var imageViewModel = ImageLoaderViewModel()
    
    var body: some View {
        VStack {
            Image(uiImage: imageViewModel.image ?? UIImage(named: "img_food_placeholder")!)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .onAppear {
                    imageViewModel.downloadImage(urlString: appertizer.imageURL)
                }
            Text(appertizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(appertizer.description)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            HStack(spacing: 40) {
                NutritionInfoView(title: "Calories", value: appertizer.calories)
                NutritionInfoView(title: "Carbs", value: appertizer.carbs)
                NutritionInfoView(title: "Protein", value: appertizer.protein)
            }
            Spacer()
            Button {
                order.add(appertizer)
                isShowingDetailView = false
            } label: {
                Text("$\(appertizer.price, specifier: "%.2f") - Add to Order")
                    .modifier(StandardButtonStyle())
            }
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .foregroundStyle(Color.black)
                    .frame(width: 30, height: 30)
                    .background(Color(white: 1, opacity: 0.6))
                    .cornerRadius(15)
                    .padding()
            }
        }
    }
}

struct NutritionInfoView: View {
    let title: String
    let value: Double
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
            Text("\(value, specifier: "%.0f")")
                .foregroundStyle(Color.gray)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppertizerDetailView(appertizer: MockData.sampleAppetizer, isShowingDetailView: .constant(true))
}
