//
//  GetContactsInteractorTest.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias - Ceiba Software on 28/09/21.
//

import XCTest
@testable import KC_Challenge

class GetContactsInteractorTest: XCTestCase {
    
    var sut: GetContactsInteractor?
    var repository = MockContactRepositoryInput()
    var presenter = MockContactInteractorOutput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GetContactsInteractor()
        sut?.repository = repository
        repository.remoteDataSource = MockContactService()
        repository.interactor = sut
        sut?.presenter = presenter
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.repository = nil
        repository.interactor = nil
        sut?.presenter = nil
        sut = nil
    }

    func testGetContacts() {
        
        // Given
        let expectation = self.expectation(description: "Fetching contacts")
        
        // When
        sut?.repository?.getContacts()
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        
        // Then
        
        XCTAssertTrue(repository.calls.didRetrieveContacts)
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(presenter.calls.didRetrieveContacts)
        XCTAssertTrue(!repository.calls.contacts.isEmpty)

    }

}
