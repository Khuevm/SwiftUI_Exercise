//
//  FrameworkGridVM.swift
//  Exercise2
//
//  Created by Khue on 9/12/25.
//

import SwiftUI
import Combine

class FrameworkGridVM: ObservableObject {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var selectedFramework: Framework?
    @Published var isShowDetailView = false
}
