//
//  HTTPMethod.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    
    var name: String {
        return rawValue
    }
}
