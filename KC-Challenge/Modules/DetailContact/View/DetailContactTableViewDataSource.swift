//
//  DetailContactTableViewDataSource.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

final class DetailContactTableViewDataSource: NSObject {
    
    private enum Constants {
        static let oneRow: Int = 1
        static let addressFormat: String = "%@ %@, %@ %@, %@"
        static let voidString: String = ""
    }
    
    private let contact: Contact
    private var sections: [DetailContactTableViewSections] = []
    
    init(contact: Contact) {
        self.contact = contact
        super.init()
        getSections()
    }
    
    private func getSections() {
        sections.append(.profile)
        if let homePhone = contact.phone.home,
           !homePhone.isEmpty {
            sections.append(.homePhone)
        }
        if let mobilePhone = contact.phone.mobile,
           !mobilePhone.isEmpty {
            sections.append(.mobilePhone)
        }
        if let workPhone = contact.phone.work,
           !workPhone.isEmpty {
            sections.append(.workPhone)
        }
        sections.append(.address)
        sections.append(.birthdate)
        sections.append(.email)
    }
}

extension DetailContactTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.oneRow
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let text: String
        
        switch section {
        case .profile:
            return configureProfileCell(tableView, indexPath: indexPath)
        case .homePhone:
            text = contact.phone.home ?? Constants.voidString
        case .mobilePhone:
            text = contact.phone.mobile ?? Constants.voidString
        case .workPhone:
            text = contact.phone.work ?? Constants.voidString
        case .address:
            text = String(format: Constants.addressFormat, contact.address.street, contact.address.city, contact.address.state, contact.address.zipCode, contact.address.country)
        case .birthdate:
            text = contact.birthdate
        case .email:
            text = contact.emailAddress
        }
        
        return configureItemInfoCell(tableView, indexPath: indexPath, title: section.titleHeader, text: text,  hint: section.hint)
    }
    
    private func configureProfileCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailContactProfileTableViewCell.reuseIdentifier) as? DetailContactProfileTableViewCell
        else {
            return UITableViewCell()
        }
        let company = contact.companyName ?? Constants.voidString
        cell.configureCell(name: contact.name, company: company, userImageUrl: contact.largeImageURL)
        return cell
    }
    
    private func configureItemInfoCell(_ tableView: UITableView, indexPath: IndexPath, title: String, text: String, hint: String?) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailContactItemInfoTableViewCell.reuseIdentifier) as? DetailContactItemInfoTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configureCell(title: title, text: text, hint: hint)
        return cell
    }
}

extension DetailContactTableViewDataSource: UITableViewDelegate {
    
}
