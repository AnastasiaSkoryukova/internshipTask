//
//  CollectionViewCell.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 15.01.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var collectionViewItem: CollectionViewInfoItem?
    
    static let reuseID = "CustomCollectionViewCell"
    let titleLabel = TextLabel(font: UIFont.systemFont(ofSize: 20, weight: .bold))
    let iconImageView = CustomImageView(frame: .zero)
    let checkImageView = CustomImageView(frame: .zero)
    let bodyLabel = TextLabel(font: UIFont.systemFont(ofSize: 15, weight: .regular))
    let priceLabel = TextLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold))
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.checkImageView.image = UIImage(named: "Checked")
            } else {
                self.checkImageView.image = UIImage(named: "EmptyImage")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(collectionViewItem: CollectionViewInfoItem) {
        self.collectionViewItem = collectionViewItem
        guard self.collectionViewItem != nil else { return }
        
        iconImageView.downloadImage(from: collectionViewItem.iconUrl)
        titleLabel.text = collectionViewItem.title
        bodyLabel.text = collectionViewItem.description
        priceLabel.text = collectionViewItem.price
    }
    
    
    private func configure() {
        
        contentView.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        addSubviews(iconImageView, titleLabel, bodyLabel, priceLabel, checkImageView)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let margin: CGFloat = 15
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            iconImageView.heightAnchor.constraint(equalToConstant: 70),
            iconImageView.widthAnchor.constraint(equalToConstant: 70),
            
            checkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            checkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            checkImageView.heightAnchor.constraint(equalToConstant: 30),
            checkImageView.widthAnchor.constraint(equalToConstant: 30),
            
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: margin),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: margin),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            
            
            priceLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor)
        ])
    }
}
