//
//  DetailContactRouterProtocols.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import Foundation

protocol DetailContactRouterProtocol {
    static func createModule(contact: Contact, delegate: DetailContactViewDelegate) -> DetailContactTableViewController
}
