//
//  NetworkManager.swift
//  Exercise4
//
//  Created by Khue on 30/12/25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://raw.githubusercontent.com/muradkv/Appetizers/main"
    
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
}
