//
//  MockContactService.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias on 28/09/21.
//

import Foundation
@testable import KC_Challenge

struct ContactServiceCalls {
    var didGetContacts: Bool = false
}

class MockContactService: BaseService, ContactRemoteServiceProtocol {
    
    lazy var calls = ContactServiceCalls()
    
    func getContacts(completion: @escaping ContactsCompletion) {
        calls.didGetContacts = true
        sendRequestMock(url: "", of: [Contact].self, method: .get, completion: completion)
    }
    
}
