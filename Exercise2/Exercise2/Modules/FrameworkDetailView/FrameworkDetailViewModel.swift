//
//  FrameworkDetailViewModel.swift
//  Exercise2
//
//  Created by Khue on 10/1/26.
//

import SwiftUI
import Combine

final class FrameworkDetailViewModel: ObservableObject {
    let framework: Framework
    var isShowDetailView: Binding<Bool>
    
    init(framework: Framework, isShowDetailView: Binding<Bool>) {
        self.isShowDetailView = isShowDetailView
        self.framework = framework
    }
}
