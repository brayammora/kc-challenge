//
//  MockContactRouter.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias on 27/09/21.
//

import Foundation
import UIKit
@testable import KC_Challenge

struct ContactRouterCalls {
    var didPresentDetailContact: Bool = false
}

class MockContactRouter: ContactRouterProtocol {
    lazy var calls = ContactRouterCalls()
    
    static func createModule() -> ContactTableViewController {
        return ContactTableViewController()
    }
    
    func presentDetailContact(contact: Contact, delegate: DetailContactViewDelegate, navController: UINavigationController?) {
        calls.didPresentDetailContact = true
    }
    
}
