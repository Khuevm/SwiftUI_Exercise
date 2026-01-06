//
//  User.swift
//  Exercise4
//
//  Created by Khue on 6/1/26.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthDate = Date()
    var isExtraNapkins = false
    var isFrequentRefills = false
}
