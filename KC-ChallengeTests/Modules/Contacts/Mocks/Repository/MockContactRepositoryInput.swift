//
//  MockContactRepositoryInput.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias on 28/09/21.
//

import Foundation
@testable import KC_Challenge

struct ContactRepositoryInputCalls {
    var didRetrieveContacts: Bool = false
    var didGetError: Bool = false
    var contacts: [Contact] = []

}
class MockContactRepositoryInput: ContactRepositoryInputProtocol {
    
    lazy var calls = ContactRepositoryInputCalls()
    
    var interactor: ContactRepositoryOutputProtocol?
    
    var remoteDataSource: ContactRemoteServiceProtocol?
    
    func getContacts() {
        remoteDataSource?.getContacts { result in
            switch result {
            case .success(let contacts):
                self.calls.didRetrieveContacts = true
                self.interactor?.didRetrieveContacts(contacts)
                self.calls.contacts = contacts
            case .failure(let error):
                self.calls.didGetError = true
                self.interactor?.didGetError(error)
            }
        }
    }
}
