//
//  GetContactsInteractor.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import Foundation

final class GetContactsInteractor: GetContactInteractorInputProtocol {
    var repository: ContactRepositoryInputProtocol?
    weak var presenter: GetContactInteractorOutputProtocol?
    
    func execute() {
        repository?.getContacts()
    }
}

extension GetContactsInteractor: ContactRepositoryOutputProtocol {
    func didRetrieveContacts(_ contacts: [Contact]) {
        presenter?.didRetrieveContacts(contacts)
    }
    
    func didGetError(_ error: CustomError) {
        presenter?.didGetError(error)
    }
    
}
