//
//  ContactTableViewDataSource.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

final class ContactTableViewDataSource: NSObject {
    private enum Constants {
        static let favoriteContactsHeaderTitle = "FAVORITE CONTACTS"
        static let otherContactsHeaderTitle = "OTHER CONTACTS"
    }
    
    weak var delegate: ContactListDelegate?
    private var sections: [ContactTableViewSections] = []
    private var contactList: [Contact]
    private var favoriteContactsList: [Contact] = []
    private var otherContactsList: [Contact] = []

    init(contactList: [Contact]) {
        self.contactList = contactList
        super.init()
        getSections()
    }
    
    private func getSections() {
        sections.removeAll()
        contactList.sortByName()
        
        favoriteContactsList = contactList.filter { $0.isFavorite }
        otherContactsList = contactList.filter { !$0.isFavorite }
        
        if !favoriteContactsList.isEmpty {
            sections.append(.favorite)
        }
        if !otherContactsList.isEmpty {
            sections.append(.otherContact)
        }
    }
}

extension ContactTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections[section]
        return section == .favorite ? Constants.favoriteContactsHeaderTitle : Constants.otherContactsHeaderTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionCell = sections[section]
        
        if sectionCell == .favorite {
            return favoriteContactsList.count
        } else {
            return otherContactsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        switch section {
        case .favorite:
            let favoriteContact = favoriteContactsList[indexPath.row]
            return configureContactCell(tableView: tableView, indexPath: indexPath, contact: favoriteContact)
        case .otherContact:
            let otherContact = otherContactsList[indexPath.row]
            return configureContactCell(tableView: tableView, indexPath: indexPath, contact: otherContact)
        }
    }
    
    private func configureContactCell(tableView: UITableView, indexPath: IndexPath, contact: Contact) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.reuseIdentifier, for: indexPath) as? ContactTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(name: contact.name, companyName: contact.companyName, isFavorite: contact.isFavorite, userImageUrl: contact.smallImageURL)
        return cell
    }
    
}

extension ContactTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        var contact: Contact
        switch section {
        case .favorite:
            contact = favoriteContactsList[indexPath.row]
        case .otherContact:
            contact = otherContactsList[indexPath.row]
        }
        delegate?.showDetail(of: contact)
    }
}
