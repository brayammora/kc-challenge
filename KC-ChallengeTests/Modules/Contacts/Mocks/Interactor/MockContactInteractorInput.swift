//
//  MockContactInteractorInput.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias on 27/09/21.
//

import Foundation
@testable import KC_Challenge

struct ShowInteractorInputCalls {
    var didExecute: Bool = false
}

class MockContactInteractorInput: GetContactInteractorInputProtocol {

    lazy var calls = ShowInteractorInputCalls()
    
    var repository: ContactRepositoryInputProtocol?
    
    var presenter: GetContactInteractorOutputProtocol?
    
    func execute() {
        calls.didExecute = true
        let contacts = [
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
        presenter?.didRetrieveContacts(contacts)
    }
}
