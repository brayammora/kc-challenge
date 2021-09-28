//
//  ContactService.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import Foundation

typealias ContactsCompletion = (Result<[Contact], CustomError>) -> Void

protocol ContactRemoteServiceProtocol {
    func getContacts(completion: @escaping  ContactsCompletion)
}

final class ContactService: BaseService, ContactRemoteServiceProtocol {
    private enum Constants {
        static let baseUrl = "https://s3.amazonaws.com/technical-challenge/v3/contacts.json"
    }
    
    func getContacts(completion: @escaping  ContactsCompletion) {
        sendRequest(url: Constants.baseUrl, of: [Contact].self, method: .get, completion: completion)
    }
}
