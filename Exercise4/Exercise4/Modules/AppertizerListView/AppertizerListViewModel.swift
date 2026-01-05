//
//  AppertizerListViewModel.swift
//  Exercise4
//
//  Created by Khue on 30/12/25.
//

import Foundation
import Combine

class AppertizerListViewModel: ObservableObject {
    @Published var appertizers: [Appertizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    var selectedAppertizer: Appertizer?
    @Published var isShowingDetailView = false
    
    func getAppertizers() {
        isLoading = true
        NetworkManager.shared.getAppertizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appertizers):
                    self.appertizers = appertizers
                case .failure(let error):
                    switch error {
                    case .networkError:
                        self.alertItem = AlertContext.networkError
                    case .networkNoData:
                        self.alertItem = AlertContext.networkNoData
                    }
                }
            }
        }
    }
}
