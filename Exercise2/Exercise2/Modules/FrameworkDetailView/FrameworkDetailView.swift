//
//  FrameworkDetailView.swift
//  Exercise2
//
//  Created by Khue on 8/12/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    @Binding var isShowDetailView: Bool
    let framework: Framework
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .frame(width: 40, height: 40)
                }
            }
            Spacer()
            Image(framework.imageName)
                .resizable()
                .frame(width: 100, height: 100)
            Text(framework.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                
            Text(framework.desc)
                .multilineTextAlignment(.center)
            Spacer()
            
            Link(destination: URL(string: framework.urlString)!) {
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

#Preview {
    FrameworkDetailView(isShowDetailView: .constant(true), framework: MockData.sampleFramework)
}
