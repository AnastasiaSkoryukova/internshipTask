//
//  ViewController.swift
//  Avito-internship
//
//  Created by Анастасия Скорюкова on 13.01.2021.
//

import UIKit


class ViewController: UIViewController {
    
    enum Section { case main }
    var jsonService = JsonService()
    
    
    var headTitle: String!
    var headTitleLabel = TextLabel(font: UIFont.systemFont(ofSize: 29, weight: .bold))
    var cancelButton = UIButton()
    
    var actionButton = Button()
    var isSelected =  false
    var actionButtonTitle: String?
    var collectionViewItems: [CollectionViewInfoItem] = []
    var collectionViewItem: CollectionViewInfoItem?
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, CollectionViewInfoItem>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonService.delegate = self
        configureCollectionView()
        collectionView.allowsMultipleSelection = false
        jsonService.getCollectionViewInfo()
        jsonService.getScreenInfo()
        
        configureViewController()
        configureCancelButton()
        configureHeadTitleLabel()
        configureActionButton()
        configureDataSource()
    }
    
    
    @objc func actionButtonTapped() {
        if self.isSelected == true  {
            let collectionView = self.collectionView
            let indexPath = collectionView?.indexPathsForSelectedItems?.first
            let cell = collectionView?.cellForItem(at: indexPath!) as? CustomCollectionViewCell
            let data = cell?.titleLabel.text
            presentCustomAlertOnMainThread(message: "Вы выбрали сервис \(data ?? "Что-то пошло не так, к сожалению, ничего не выбрано.")", buttonTitle: "OK")
        } else {
            print("No item is selected")
            return
        }
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    
    func configureCancelButton() {
        view.addSubview(cancelButton)
        
        cancelButton.setImage(UIImage(named: "cancel"), for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            cancelButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    func configureHeadTitleLabel() {
        view.addSubview(headTitleLabel)
        headTitleLabel.text = headTitle
        
        NSLayoutConstraint.activate([
            headTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 23),
            headTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            headTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
    func configureActionButton() {
        view.addSubview(actionButton)
        actionButton.setTitle(actionButtonTitle, for: .normal)
        
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseID)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, CollectionViewInfoItem>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, collectionViewItem) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseID, for: indexPath) as! CustomCollectionViewCell
            
            cell.set(collectionViewItem: collectionViewItem)
            
            return cell
        })
    }
    
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CollectionViewInfoItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(collectionViewItems)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}


extension ViewController: JsonServiceDelegate {
    func collectionViewItemsFetched(_ items: [CollectionViewInfoItem]) {
        self.collectionViewItems = items
        self.updateData()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    func screenViewInfoFetched(_ data: ScreenViewInfo) {
        self.headTitle = data.title
        self.actionButtonTitle = data.selectedActionTitle
        configureHeadTitleLabel()
    }
}


extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let item = collectionView.cellForItem(at: indexPath)
        if item?.isSelected ?? false {
            collectionView.deselectItem(at: indexPath, animated: true)
            self.isSelected = false
        } else {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
            self.isSelected = true
            return true
        }
        return false
    }
}


