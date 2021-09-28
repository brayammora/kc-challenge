//
//  MockContactInteractorOutput.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias on 27/09/21.
//

import Foundation
@testable import KC_Challenge

struct GetContactInteractorOutputCalls {
    var didRetrieveContacts: Bool = false
    var didGetError: Bool = false

}
class MockContactInteractorOutput: GetContactInteractorOutputProtocol {
    lazy var calls = GetContactInteractorOutputCalls()
    
    func didRetrieveContacts(_ contacts: [Contact]) {
        calls.didRetrieveContacts = true
    }
    
    func didGetError(_ error: CustomError) {
        calls.didGetError = true
    }
    
    
    
}
