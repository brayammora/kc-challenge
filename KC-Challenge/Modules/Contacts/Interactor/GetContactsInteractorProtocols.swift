//
//  ProtocolsInteractor.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

protocol GetContactInteractorInputProtocol {
    var repository: ContactRepositoryInputProtocol? { get set }
    var presenter: GetContactInteractorOutputProtocol? { get set }
    
    func execute()
}

protocol GetContactInteractorOutputProtocol: AnyObject {
    func didRetrieveContacts(_ contacts: [Contact])
    func didGetError(_ error: CustomError)
}
