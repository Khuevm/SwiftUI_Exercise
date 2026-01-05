//
//  ImageLoaderViewModel.swift
//  Exercise4
//
//  Created by Khue on 5/1/26.
//

import UIKit
import Combine

class ImageLoaderViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    
    func downloadImage(urlString: String) {
        NetworkManager.shared.downloadImage(urlString: urlString) { img in
            DispatchQueue.main.async {
                self.image = img
            }
        }
    }
}
