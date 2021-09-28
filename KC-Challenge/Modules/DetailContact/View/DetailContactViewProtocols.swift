//
//  DetailContactViewProtocols.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import Foundation

protocol DetailContactViewProtocol {
    var presenter: DetailContactPresenterInputProtocol? { get set }
}

protocol DetailContactViewDelegate: AnyObject {
    func updateContactList(contact: Contact?)
}
