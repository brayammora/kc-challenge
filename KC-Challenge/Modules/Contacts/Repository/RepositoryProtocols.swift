//
//  ProtocolsRepository.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

protocol ContactRepositoryInputProtocol {
    var interactor: ContactRepositoryOutputProtocol? { get set }
    var remoteDataSource: ContactRemoteServiceProtocol? { get set }
    
    func getContacts()
}

protocol ContactRepositoryOutputProtocol: AnyObject {
    func didRetrieveContacts(_ contacts: [Contact])
    func didGetError(_ error: CustomError)
}
