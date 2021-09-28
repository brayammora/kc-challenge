//
//  DetailContactItemInfoTableViewCell.swift
//  KC-Challenge
//
//  Created by Brayam Alberto Mora Arias on 26/09/21.
//

import UIKit

final class DetailContactItemInfoTableViewCell: UITableViewCell {
    
    private enum Constants {
        enum TitleLabel {
            static let padding: UIEdgeInsets = .init(top: 20, left: 14, bottom: 0, right: 0)
            static let textColor: UIColor? = .gray
            static let font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        }
        
        enum InformationLabel {
            static let padding: UIEdgeInsets = .init(top: 10, left: 0, bottom: -14, right: -10)
            static let textColor: UIColor? = .black
            static let font = UIFont.systemFont(ofSize: 14, weight: .bold)
            static let numberOfLines = 0
        }
        
        enum HintLabel {
            static let padding: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -14)
            static let textColor: UIColor? = .gray
            static let font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.TitleLabel.textColor
        label.font = Constants.TitleLabel.font
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.InformationLabel.textColor
        label.font = Constants.InformationLabel.font
        label.numberOfLines = Constants.InformationLabel.numberOfLines
        return label
    }()
    
    private lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.HintLabel.textColor
        label.font = Constants.HintLabel.font
        return label
    }()
    
    func configureCell(title: String, text: String, hint: String?) {
        configureDataCell(title: title, text: text, hint: hint)
        configureView()
        configureConstraints()
    }
    
    private func configureDataCell(title: String, text: String, hint: String?) {
        titleLabel.text = title
        informationLabel.text = text
        hintLabel.text = hint
    }
    
    private func configureView() {
        contentView.backgroundColor = .white
        contentView.addSubview(titleLabel)
        contentView.addSubview(informationLabel)
        contentView.addSubview(hintLabel)
    }
    
    private func configureConstraints() {
        titleLabelConstraints()
        informationLabelConstraints()
        hintLabelConstraints()
    }
    
    private func titleLabelConstraints() {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.TitleLabel.padding.top),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.TitleLabel.padding.left)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func informationLabelConstraints() {
        let constraints = [
            informationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.InformationLabel.padding.top),
            informationLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            informationLabel.trailingAnchor.constraint(lessThanOrEqualTo: hintLabel.leadingAnchor, constant: Constants.InformationLabel.padding.right),
            informationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constants.InformationLabel.padding.bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func hintLabelConstraints() {
        let constraints = [
            hintLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.HintLabel.padding.right),
            hintLabel.centerYAnchor.constraint(equalTo: informationLabel.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
