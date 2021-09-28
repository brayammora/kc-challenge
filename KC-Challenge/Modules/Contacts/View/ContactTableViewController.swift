//
//  ContactTableViewController.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 25/09/21.
//

import UIKit

final class ContactTableViewController: UITableViewController, ContactViewProtocol {
    
    private enum Constants {
        static let title = "Contacts"
    }
    
    var presenter: ContactPresenterInputProtocol?
    private var contactTableViewDataSource: ContactTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureView()
        getContacts()
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.reuseIdentifier)
    }
    
    private func configureView() {
        title = Constants.title
    }

    private func getContacts() {
        presenter?.getContacts()
    }
    
}

extension ContactTableViewController: ContactPresenterOutputProtocol {
    func didRetrieveContacts() {
        guard let contacts = presenter?.contacts else {
            return
        }
        contactTableViewDataSource = ContactTableViewDataSource(contactList: contacts)
        contactTableViewDataSource?.delegate = self
        DispatchQueue.main.async { [weak self] in
            self?.tableView.dataSource = self?.contactTableViewDataSource
            self?.tableView.delegate = self?.contactTableViewDataSource
            self?.tableView.reloadData()
        }
    }
    
    func didGetError(_ error: CustomError) {
        /// todo
    }
}

extension ContactTableViewController: ContactListDelegate {
    func showDetail(of contact: Contact) {
        presenter?.gotToDetail(contact: contact, view: self.navigationController)
    }
    
}
