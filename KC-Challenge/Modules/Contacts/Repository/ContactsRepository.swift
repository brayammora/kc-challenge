//
//  ContactsRepository.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import Foundation

final class ContactsRepository: ContactRepositoryInputProtocol {
    
    var remoteDataSource: ContactRemoteServiceProtocol?
    weak var interactor: ContactRepositoryOutputProtocol?
    
    func getContacts() {
        remoteDataSource?.getContacts { result in
            switch result {
            case .success(let contacts):
                self.interactor?.didRetrieveContacts(contacts)
            case .failure(let error):
                self.interactor?.didGetError(error)
            }
        }
    }
}
