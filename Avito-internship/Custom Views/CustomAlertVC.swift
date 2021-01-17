//
//  CustomAlert.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 17.01.2021.
//

import UIKit

class CustomAlertVC: UIViewController {
    
    let containerView = UIView()
    let messageLabel = TextLabel(font: UIFont.systemFont(ofSize: 18, weight: .regular))
    let actionButton = Button()
    
    var message: String?
    var buttonTitle: String?
    
    let margin: CGFloat = 20
    
    
    init(message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureActionButton()
        configureMessageLabel()
    }
    
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    
    
    func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -margin),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: margin),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text           = message ?? ""
        messageLabel.numberOfLines  = 0
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: margin),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}

