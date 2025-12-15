//
//  Framework.swift
//  Exercise2
//
//  Created by Khue on 8/12/25.
//

import Foundation

struct Framework: Hashable, Identifiable {
    let id = UUID()
    
    let name: String
    let imageName: String
    let urlString: String
    let desc: String
}
