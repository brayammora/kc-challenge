//
//  ContactPresenterTest.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias - Ceiba Software on 28/09/21.
//

import XCTest
@testable import KC_Challenge

class ContactPresenterTest: XCTestCase {
    
    var sut: ContactPresenter?
    let interactor = MockContactInteractorInput()
    let router = MockContactRouter()
    let view = MockContactPresenterOutput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ContactPresenter()
        sut?.getContactsInteractor = interactor
        interactor.presenter = sut
        sut?.router = router
        sut?.view = view
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.getContactsInteractor = nil
        interactor.presenter = nil
        sut?.router = nil
        sut?.view = nil
        sut = nil
    }
    
    func testGetContacts() {
        sut?.getContacts()
        XCTAssertTrue(interactor.calls.didExecute)
        XCTAssertEqual(sut?.contacts.count, 1)
    }
    
    func testGoToDetail() {
        // Given
        let contact: Contact = Contact(
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
        let navController = UINavigationController()
        
        // When
        sut?.gotToDetail(contact: contact, view: navController)
        
        // Then
        XCTAssertTrue(router.calls.didPresentDetailContact)
    }
}
