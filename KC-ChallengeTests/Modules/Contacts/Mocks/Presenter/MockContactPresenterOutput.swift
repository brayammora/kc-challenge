//
//  MockContactPresenterOutput.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias on 27/09/21.
//

import Foundation
import UIKit
@testable import KC_Challenge

struct ContactPresenterOutputCalls {
    var didRetrieveContacts: Bool = false
    var didGetError: Bool = false
}

class MockContactPresenterOutput: ContactPresenterOutputProtocol {
    
    lazy var calls = ContactPresenterOutputCalls()
    
    func didRetrieveContacts() {
        calls.didRetrieveContacts = true
    }
    
    func didGetError(_ error: CustomError) {
        calls.didGetError = true
    }
    
    
}
