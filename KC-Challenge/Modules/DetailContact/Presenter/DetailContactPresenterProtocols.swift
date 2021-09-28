//
//  DetailContactPresenterProtocols.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

protocol DetailContactPresenterInputProtocol {
    var contact: Contact? { get set }
    var view: DetailContactPresenterOutputProtocol? { get set }
    var router: DetailContactRouterProtocol? { get set }
    var contactViewDelegate: DetailContactViewDelegate? { get set }
    
    func viewDidLoad()
    func getContactDetailStar() -> UIImage?
    func updateContactFavoriteStatus()
}

protocol DetailContactPresenterOutputProtocol: AnyObject {
    func didRetrieveContact()
}
