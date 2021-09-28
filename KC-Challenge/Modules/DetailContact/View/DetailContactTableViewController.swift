//
//  DetailContactTableViewController.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

final class DetailContactTableViewController: UITableViewController, DetailContactViewProtocol {
    private enum Constants {
        static let leftActionTitle = "Contacts"
    }
    
    var presenter: DetailContactPresenterInputProtocol?
    private var detailContactTableViewDataSource: DetailContactTableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavBar()
        presenter?.viewDidLoad()
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(DetailContactProfileTableViewCell.self, forCellReuseIdentifier: DetailContactProfileTableViewCell.reuseIdentifier)
        tableView.register(DetailContactItemInfoTableViewCell.self, forCellReuseIdentifier: DetailContactItemInfoTableViewCell.reuseIdentifier)
    }
    
    private func configureNavBar() {
        let starIcon = UIBarButtonItem(image: presenter?.getContactDetailStar(), style: .plain, target: self, action: #selector(handleUserTappingStar))
        navigationItem.rightBarButtonItem = starIcon
    }
    
    @objc private func handleUserTappingStar() {
        presenter?.updateContactFavoriteStatus()
        configureNavBar()
    }
}

extension DetailContactTableViewController: DetailContactPresenterOutputProtocol {
    func didRetrieveContact() {
        guard let contact = presenter?.contact else {
            return
        }
        detailContactTableViewDataSource = DetailContactTableViewDataSource(contact: contact)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.dataSource = self?.detailContactTableViewDataSource
            self?.tableView.delegate = self?.detailContactTableViewDataSource
            self?.tableView.reloadData()
        }
    }
}
