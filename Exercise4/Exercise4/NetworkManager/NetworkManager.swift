//
//  NetworkManager.swift
//  Exercise4
//
//  Created by Khue on 30/12/25.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://raw.githubusercontent.com/muradkv/Appetizers/main"
    
    private let cache = NSCache<NSString, UIImage>()
    private let appertizerURL = baseURL + "/Appetizers/Appetizers.json"
    
    func getAppertizers(complete: @escaping (Result<[Appertizer], APError>) -> Void){
        guard let url = URL(string: appertizerURL) else {
            complete(.failure(.networkError))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, respond, error in
            guard let data, let respond = respond as? HTTPURLResponse,
                  respond.statusCode == 200 else {
                complete(.failure(.networkError))
                return
            }
            
            let decodedData = try? JSONDecoder().decode(AppertizerRespond.self, from: data)
            let request = decodedData?.request ?? []
            if request.isEmpty {
                complete(.failure(.networkNoData))
                return
            }
            complete(.success(request))
        }.resume()
    }
    
    func downloadImage(urlString: String, complete: @escaping (UIImage?) -> Void){
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            complete(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            complete(nil)
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
            guard let data, let image = UIImage(data: data) else {
                complete(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            complete(image)
        }.resume()
    }
}
