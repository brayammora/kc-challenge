//
//  MockContactPresenterInput.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias - Ceiba Software on 27/09/21.
//

import Foundation
import UIKit
@testable import KC_Challenge

struct ContactPresenterInputCalls {
    var didGetContacts: Bool = false
    var digGoToDetail: Bool = false

}

class MockContactPresenterInput: ContactPresenterInputProtocol {
    var contacts: [Contact] = []
    var view: ContactPresenterOutputProtocol?
    var getContactsInteractor: GetContactInteractorInputProtocol?
    var router: ContactRouterProtocol?
    
    lazy var calls = ContactPresenterInputCalls()
    
    func getContacts() {
        calls.didGetContacts = true
        contacts = [
            Contact(
                name: "Miss Piggy",
                id: "13",
                companyName: "Muppets, Baby",
                isFavorite: false,
                smallImageURL: "https://s3.amazonaws.com/technical-challenge/v3/images/miss-piggy-small.jpg",
                largeImageURL: "https://s3.amazonaws.com/technical-challenge/v3/images/miss-piggy-large.jpg",
                emailAddress: "Miss.Piggy@muppetsbaby.com",
                birthdate: "1987-05-11",
                phone: Phone(work: "602-225-9543", home: "602-225-9188", mobile: ""),
                address: Address(street: "3530 E Washington St", city: "Phoenix", state: "AZ", country: "US", zipCode: "85034")
            )
        ]
        view?.didRetrieveContacts()
    }
    
    func gotToDetail(contact: Contact, view: UINavigationController?) {
        calls.digGoToDetail = true
    }
    
    
    
}
