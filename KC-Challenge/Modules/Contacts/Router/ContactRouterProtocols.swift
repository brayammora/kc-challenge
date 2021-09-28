//
//  ContactRouterProtocols.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

protocol ContactRouterProtocol {
    static func createModule() -> ContactTableViewController
    func presentDetailContact(contact: Contact, delegate: DetailContactViewDelegate, navController: UINavigationController?)
}
