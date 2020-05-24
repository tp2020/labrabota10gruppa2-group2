//
//  FirstViewController.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
    //MARK: Properties
    
    public static var accounts = [Account]()
    @IBOutlet weak var accountsCollectionView: UICollectionView!
    
    //MARK: View actions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountsCollectionView.dataSource = self
        accountsCollectionView.delegate = self
    }
    
    //MARK: Collection view actions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AccountsViewController.accounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            
            itemCell.item = AccountsViewController.accounts[indexPath.row]
            
            return itemCell
        }
        return UICollectionViewCell()
    }
}

