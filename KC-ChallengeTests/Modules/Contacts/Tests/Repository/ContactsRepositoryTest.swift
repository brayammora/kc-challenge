//
//  ContactsRepositoryTest.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias on 28/09/21.
//

import XCTest
@testable import KC_Challenge

class ContactsRepositoryTest: XCTestCase {
    
    var sut: ContactsRepository?
    var remoteDataSource = MockContactService()
    var interactor = MockContactRepositoryOutput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ContactsRepository()
        sut?.interactor = interactor
        sut?.remoteDataSource = remoteDataSource
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.remoteDataSource = nil
        sut?.interactor = nil
        sut = nil
    }

    func testGetContacts() {
        sut?.getContacts()
        
        XCTAssertTrue(interactor.calls.didRetrieveContacts)
    }

}
