//
//  UIView+Ext.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 14.01.2021.
//

import UIKit
//An extension for adding several subviews to the view at once

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
