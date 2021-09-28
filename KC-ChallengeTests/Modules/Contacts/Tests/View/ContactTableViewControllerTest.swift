//
//  ContactTableViewControllerTest.swift
//  KC-ChallengeTests
//
//  Created by Brayam Alberto Mora Arias on 28/09/21.
//

import XCTest
@testable import KC_Challenge

class ContactTableViewControllerTest: XCTestCase {
    
    var sut: ContactTableViewController?
    let presenter = MockContactPresenterInput()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ContactTableViewController()
        sut?.presenter = presenter
        presenter.view = sut
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut?.presenter = nil
        presenter.view = nil
        sut = nil
    }
    
    func testOutlets() {
        sut?.loadViewIfNeeded()
        let registeredCellClass = sut?.tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.reuseIdentifier)
        XCTAssertEqual(sut?.title, "Contacts")
        XCTAssertNotNil(registeredCellClass)
    }

    func testViewDidLoad() {
        // When
        sut?.loadViewIfNeeded()
        
        // Then
        XCTAssertTrue(presenter.calls.didGetContacts)
    }
    
}
