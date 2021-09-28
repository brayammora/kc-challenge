//
//  ContactTableViewCell.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

final class ContactTableViewCell: UITableViewCell {
    
    private enum Constants {
        enum UserImageView {
            static let padding: UIEdgeInsets = .init(top: 24, left: 12, bottom: -12, right: 0)
            static let width: CGFloat = 50
            static let height: CGFloat = 50
            static let image: UIImage? = UIImage(named: "userSmall")
        }
        
        enum StarImageView {
            static let padding: UIEdgeInsets = .init(top: 8, left: 16, bottom: 0, right: 0)
            static let width: CGFloat = 20
            static let height: CGFloat = 20
            static let image: UIImage? = UIImage(named: "favoriteStar")
        }
        
        enum NameLabel {
            static let padding: UIEdgeInsets = .init(top: 0, left: 8, bottom: 0, right: -8)
            static let textColor: UIColor? = .black
            static let font: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
        
        enum CompanyLabel {
            static let padding: UIEdgeInsets = .init(top: 2, left: 0, bottom: 0, right: 0)
            static let textColor: UIColor? = .gray
            static let font: UIFont = UIFont.systemFont(ofSize: 12, weight: .light)
            static let noName: String = ""
        }
        
    }
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = Constants.UserImageView.image
        return imageView
    }()
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = Constants.StarImageView.image
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.NameLabel.textColor
        label.font = Constants.NameLabel.font
        return label
    }()
    
    private lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.CompanyLabel.textColor
        label.font = Constants.CompanyLabel.font
        return label
    }()
    
    func configureCell(name: String, companyName: String?, isFavorite: Bool, userImageUrl: String) {
        configureDataCell(name: name, companyName: companyName, isFavorite: isFavorite, userImageUrl: userImageUrl)
        configureView(isFavorite: isFavorite)
        configureConstraints()
    }
    
    private func configureDataCell(name: String, companyName: String?, isFavorite: Bool, userImageUrl: String) {
        nameLabel.text = name
        companyLabel.text = companyName ?? Constants.CompanyLabel.noName
        userImageView.downloadImage(from: userImageUrl)
    }
    
    private func configureView(isFavorite: Bool) {
        contentView.backgroundColor = .white
        contentView.addSubview(userImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(companyLabel)
        contentView.addSubview(starImageView)
        starImageView.isHidden = !isFavorite
    }
    
    private func configureConstraints() {
        userImageViewConstraints()
        starImageViewConstraints()
        nameLabelConstraints()
        companyLabelConstraints()
    }
    
    private func userImageViewConstraints() {
        let constraints = [
            userImageView.widthAnchor.constraint(equalToConstant: Constants.UserImageView.width),
            userImageView.heightAnchor.constraint(equalToConstant: Constants.UserImageView.height),
            userImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.UserImageView.padding.left),
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.UserImageView.padding.top),
            userImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.UserImageView.padding.bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func starImageViewConstraints() {
        let constraints = [
            starImageView.widthAnchor.constraint(equalToConstant: Constants.StarImageView.width),
            starImageView.heightAnchor.constraint(equalToConstant: Constants.StarImageView.height),
            starImageView.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: Constants.StarImageView.padding.top),
            starImageView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Constants.StarImageView.padding.left)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func nameLabelConstraints() {
        let constraints = [
            nameLabel.topAnchor.constraint(equalTo: starImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: Constants.NameLabel.padding.left),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.NameLabel.padding.right)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func companyLabelConstraints() {
        let constraints = [
            companyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.CompanyLabel.padding.top),
            companyLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            companyLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
