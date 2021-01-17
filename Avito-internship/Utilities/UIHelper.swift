//
//  UIHelper.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 15.01.2021.
//

import UIKit

enum UIHelper {
    
    static func createFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let margin: CGFloat = 20
        let availableWidth = width - (margin * 2) - 15 - 15
        let itemWidth = availableWidth
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 30
        
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth / 2)
        
        return flowLayout
    }
}

