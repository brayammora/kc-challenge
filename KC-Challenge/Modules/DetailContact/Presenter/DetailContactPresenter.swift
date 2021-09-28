//
//  DetailContactPresenter.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

final class DetailContactPresenter: DetailContactPresenterInputProtocol {

    private enum Constants {
        static let favoriteStar = UIImage(named: "favoriteStar")
        static let unfavoriteStar = UIImage(named: "noFavoriteStar")
    }
    
    var contact: Contact?
    weak var view: DetailContactPresenterOutputProtocol?
    var router: DetailContactRouterProtocol?
    weak var contactViewDelegate: DetailContactViewDelegate?
    
    func viewDidLoad() {
        view?.didRetrieveContact()
    }
    
    func getContactDetailStar() -> UIImage? {
        guard let contact = contact else {
            return nil
        }

        return contact.isFavorite ? Constants.favoriteStar : Constants.unfavoriteStar
    }
    
    func updateContactFavoriteStatus() {
        contact?.isFavorite.toggle()
        contactViewDelegate?.updateContactList(contact: contact)
    }
}
