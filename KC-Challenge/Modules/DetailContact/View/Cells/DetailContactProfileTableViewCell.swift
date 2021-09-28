//
//  DetailContactProfileTableViewCell.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

final class DetailContactProfileTableViewCell: UITableViewCell {
    
    private enum Constants {
        enum ProfileImageView {
            static let userImage: UIImage? = UIImage(named: "userLarge")
            static let padding: UIEdgeInsets = .init(top: 20, left: 0, bottom: 0, right: 0)
            static let width: CGFloat = 150
            static let height: CGFloat = 150
        }
        
        enum NameLabel {
            static let padding: UIEdgeInsets = .init(top: 12, left: 10, bottom: 0, right: -10)
            static let textColor: UIColor? = .black
            static let font = UIFont.systemFont(ofSize: 20, weight: .bold)
            static let textAlignment: NSTextAlignment = .center
        }
        
        enum CompanyLabel {
            static let padding: UIEdgeInsets = .init(top: 6, left: 0, bottom: -10, right: 0)
            static let textColor: UIColor? = .gray
            static let font = UIFont.systemFont(ofSize: 12, weight: .light)
            static let textAlignment: NSTextAlignment = .center
        }
    }
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = Constants.ProfileImageView.userImage
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.NameLabel.textColor
        label.font = Constants.NameLabel.font
        label.textAlignment = Constants.NameLabel.textAlignment
        return label
    }()
    
    private lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.CompanyLabel.textColor
        label.font = Constants.CompanyLabel.font
        label.textAlignment = Constants.CompanyLabel.textAlignment
        return label
    }()
    
    func configureCell(name: String, company: String, userImageUrl: String) {
        configureDataCell(name: name, company: company, userImageUrl: userImageUrl)
        configureView()
        configureConstraints()
    }
    
    private func configureDataCell(name: String, company: String, userImageUrl: String) {
        nameLabel.text = name
        companyLabel.text = company
        profileImageView.downloadImage(from: userImageUrl)
    }
    
    private func configureView() {
        contentView.backgroundColor = .white
        contentView.addSubview(nameLabel)
        contentView.addSubview(companyLabel)
        contentView.addSubview(profileImageView)
    }
    
    private func configureConstraints() {
        profileImageViewConstraints()
        nameLabelViewConstraints()
        companyLabelViewConstraints()
    }
    
    private func profileImageViewConstraints() {
        let constraints = [
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.ProfileImageView.padding.top),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: Constants.ProfileImageView.width),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.ProfileImageView.height)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func nameLabelViewConstraints() {
        let constraints = [
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Constants.NameLabel.padding.top),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.NameLabel.padding.left),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.NameLabel.padding.right)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func companyLabelViewConstraints() {
        let constraints = [
            companyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.CompanyLabel.padding.top),
            companyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            companyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.CompanyLabel.padding.bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
