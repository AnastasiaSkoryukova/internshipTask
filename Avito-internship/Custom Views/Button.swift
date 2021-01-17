//
//  Button.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 15.01.2021.
//

import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        backgroundColor = #colorLiteral(red: 0, green: 0.6809977293, blue: 1, alpha: 0.827523541)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

