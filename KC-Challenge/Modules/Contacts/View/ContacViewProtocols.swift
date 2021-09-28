//
//  ViewProtocols.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import Foundation

protocol ContactViewProtocol {
    var presenter: ContactPresenterInputProtocol? { get set }
}

protocol ContactListDelegate: AnyObject {
    func showDetail(of contact: Contact)
}
