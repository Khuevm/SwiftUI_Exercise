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
    
    func getAppertizers() {
        NetworkManager.shared.getAppertizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appertizers):
                    self.appertizers = appertizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
