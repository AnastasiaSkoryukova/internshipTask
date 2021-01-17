//
//  UIViewController+ext.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 17.01.2021.
//

import UIKit

//An extension for presenting the custom alert in the main queue

extension UIViewController {
    
    func presentCustomAlertOnMainThread(message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = CustomAlertVC(message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
