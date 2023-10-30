//
//  BeerTableViewCell.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    static let identifier = "BeerTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let taglineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setUpConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(taglineLabel)
        
        NSLayoutConstraint.autoresizingMask([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: taglineLabel.topAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.autoresizingMask([
            taglineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            taglineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            taglineLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            taglineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func configure(with item: BeerModel) {
        titleLabel.text = item.name
        taglineLabel.text = item.tagline
    }
}
