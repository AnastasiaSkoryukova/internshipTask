//
//  TitleLabel.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 14.01.2021.
//

import UIKit

class TextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(font: UIFont) {
        self.init(frame: .zero)
        self.font = font
    }
    
    
    private func configure() {
        
        numberOfLines = 0
        adjustsFontSizeToFitWidth   = false
        adjustsFontForContentSizeCategory = true
        minimumScaleFactor = 0.9
        
        lineBreakMode = .byWordWrapping
        textAlignment = .left
        textColor = .black
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

