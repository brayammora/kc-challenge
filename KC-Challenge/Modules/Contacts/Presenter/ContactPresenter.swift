//
//  ContactPresenter.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import UIKit

final class ContactPresenter: ContactPresenterInputProtocol {

    var contacts: [Contact] = []
    weak var view: ContactPresenterOutputProtocol?
    var getContactsInteractor: GetContactInteractorInputProtocol?
    var router: ContactRouterProtocol?
    
    func getContacts() {
        getContactsInteractor?.execute()
    }
    
    func gotToDetail(contact: Contact, view: UINavigationController?) {
        router?.presentDetailContact(contact: contact, delegate: self, navController: view)
    }
}

extension ContactPresenter: GetContactInteractorOutputProtocol {
    func didRetrieveContacts(_ contacts: [Contact]) {
        self.contacts = contacts
        view?.didRetrieveContacts()
    }
    
    func didGetError(_ error: CustomError) {
        view?.didGetError(error)
    }
}

extension ContactPresenter: DetailContactViewDelegate {
    func updateContactList(contact: Contact?) {
        guard let contact = contact else {
            return
        }
        contacts = contacts.map { $0.id != contact.id ? $0 : contact }
        view?.didRetrieveContacts()
    }
    
}
