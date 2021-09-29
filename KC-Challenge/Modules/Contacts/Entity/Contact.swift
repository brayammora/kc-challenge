//
//  Contact.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import Foundation

struct Contact: Codable {
    let name: String
    let id: String
    let companyName: String?
    var isFavorite: Bool
    let smallImageURL: String
    let largeImageURL: String
    let emailAddress: String
    let birthdate: String
    let phone: Phone
    let address: Address
    
}

extension Array where Element == Contact {
    mutating func sortByName() {
        self.sort(by: { $0.name < $1.name })
    }
}


