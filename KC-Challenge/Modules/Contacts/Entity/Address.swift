//
//  Address.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import Foundation

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let country: String
    let zipCode: String
}
