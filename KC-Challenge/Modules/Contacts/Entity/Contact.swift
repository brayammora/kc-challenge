//
//  Contact.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import Foundation

class Contact: Codable {
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
    
    public init(name: String, id: String, companyName: String?, isFavorite: Bool, smallImageURL: String, largeImageURL: String, emailAddress: String, birthdate: String, phone: Phone, address: Address) {
        self.name = name
        self.id = id
        self.companyName = companyName
        self.isFavorite = isFavorite
        self.smallImageURL = smallImageURL
        self.largeImageURL = largeImageURL
        self.emailAddress = emailAddress
        self.birthdate = birthdate
        self.phone = phone
        self.address = address
    }
}

extension Array where Element == Contact {
    mutating func sortByName() {
        self.sort(by: { $0.name < $1.name })
    }
}


