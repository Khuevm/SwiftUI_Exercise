//
//  EmptyStateView.swift
//  Exercise4
//
//  Created by Khue on 7/1/26.
//

import SwiftUI

struct EmptyStateView: View {
    let imageName: String
    let desc: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(desc)
                .foregroundStyle(Color.secondary)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
        }
        .offset(y: -50)
    }
}

#Preview {
    EmptyStateView(imageName: "img_empty_order", desc: "You have no order.\nPlease add an appertizer")
}
