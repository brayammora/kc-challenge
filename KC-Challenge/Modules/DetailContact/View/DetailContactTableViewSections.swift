//
//  DetailContactTableViewSections.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import Foundation

enum DetailContactTableViewSections: CaseIterable {
    case profile
    case homePhone
    case mobilePhone
    case workPhone
    case address
    case birthdate
    case email
    
    var titleHeader: String {
        switch self {
        case .homePhone, .mobilePhone, .workPhone:
            return "PHONE:"
        case .address:
            return "ADDRESS:"
        case .birthdate:
            return "BIRTHDATE"
        case .email:
            return "EMAIL"
        default:
            return ""
        }
    }
    
    var hint: String? {
        switch self {
        case .homePhone:
            return "Home"
        case .mobilePhone:
            return "Mobile"
        case .workPhone:
            return "Work"
        default:
            return nil
        }
    }
}
