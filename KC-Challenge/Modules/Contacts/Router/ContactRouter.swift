//
//  ContactRouter.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import UIKit

final class ContactRouter: ContactRouterProtocol {
    static func createModule() -> ContactTableViewController {
        
        typealias ViewProtocols = ContactViewProtocol & ContactPresenterOutputProtocol
        typealias PresenterProtocols = ContactPresenterInputProtocol & GetContactInteractorOutputProtocol
        typealias InteractorProtocols = GetContactInteractorInputProtocol & ContactRepositoryOutputProtocol
        
        var view: ViewProtocols = ContactTableViewController()
        var presenter: PresenterProtocols = ContactPresenter()
        var interactor: InteractorProtocols = GetContactsInteractor()
        var repository: ContactRepositoryInputProtocol = ContactsRepository()
        let router: ContactRouterProtocol = ContactRouter()
        let remoteDataSource: ContactRemoteServiceProtocol = ContactService()
        
        view.presenter = presenter
        presenter.view = view
        presenter.getContactsInteractor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.repository = repository
        repository.interactor = interactor
        repository.remoteDataSource = remoteDataSource
        
        return view as! ContactTableViewController
    }
    
    func presentDetailContact(contact: Contact, delegate: DetailContactViewDelegate, navController: UINavigationController?) {
        let detailContactTableViewController: DetailContactTableViewController = DetailContactRouter.createModule(contact: contact, delegate: delegate)
        navController?.pushViewController(detailContactTableViewController, animated: true)
    }
    
    
}
