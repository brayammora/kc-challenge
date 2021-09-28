//
//  DetailContactRouter.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

final class DetailContactRouter: DetailContactRouterProtocol {
    static func createModule(contact: Contact, delegate: DetailContactViewDelegate) -> DetailContactTableViewController {
        
        typealias ViewProtocols = DetailContactViewProtocol & DetailContactPresenterOutputProtocol
        typealias PresenterProtocols = DetailContactPresenterInputProtocol
        
        var view: ViewProtocols = DetailContactTableViewController()
        var presenter: PresenterProtocols = DetailContactPresenter()
        let router: DetailContactRouterProtocol = DetailContactRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.contact = contact
        presenter.contactViewDelegate = delegate
        
        return view as! DetailContactTableViewController
    }

}
