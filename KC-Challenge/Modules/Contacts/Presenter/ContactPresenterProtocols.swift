//
//  PresenterProtocols.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import UIKit

protocol ContactPresenterInputProtocol {
    var contacts: [Contact] { get set }
    var view: ContactPresenterOutputProtocol? { get set }
    var getContactsInteractor: GetContactInteractorInputProtocol? { get set }
    var router: ContactRouterProtocol? { get set }
    
    func getContacts()
    func gotToDetail(contact: Contact, view: UINavigationController?)
}

protocol ContactPresenterOutputProtocol: AnyObject {
    func didRetrieveContacts()
    func didGetError(_ error: CustomError)
}
