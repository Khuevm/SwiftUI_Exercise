//
//  CustomModifiers.swift
//  Exercise4
//
//  Created by Khue on 7/1/26.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(Color.accent)
            .cornerRadius(8)
            .padding()
    }
}
