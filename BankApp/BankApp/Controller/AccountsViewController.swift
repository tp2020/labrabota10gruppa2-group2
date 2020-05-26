//
//  FirstViewController.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit
import CoreData

class AccountsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
    //MARK: Properties
    
    public static var accounts = [Account]()
    @IBOutlet weak var accountsCollectionView: UICollectionView!
    
    let creditTypes = [String](arrayLiteral:
        "Credit",
        "Savings",
        "Credit card account",
        "Savings card account")
    
    //MARK: View actions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountsCollectionView.dataSource = self
        accountsCollectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAccountDetails" {
            if let vc = segue.destination as? DetailViewController {
                let account = sender as? MenuCollectionViewCell
                vc.account = account?.item
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                
                let managedObjectContext = appDelegate.persistentContainer.viewContext
                var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Validities")
                
                do {
                    let results = try managedObjectContext.fetch(fetchRequest)
                    
                    for data in results as! [NSManagedObject] {
                        let id = data.value(forKey: "id") as! Int
                        
                        if id == vc.account!.id {
                            vc.account!.issueDate = data.value(forKey: "issue_date") as? String
                            vc.account!.validityTo = data.value(forKey: "validity_to") as? String
                            break
                        }
                    }
                    
                }
                catch let error as NSError {
                    print("Data loading error: \(error)")
                    return
                }
                
                fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currencies")
                
                do {
                    let results = try managedObjectContext.fetch(fetchRequest)
                    
                    for data in results as! [NSManagedObject] {
                        let id = data.value(forKey: "id") as! Int
                        
                        if id == vc.account!.currencyId {
                            vc.account!.currencyName = data.value(forKey: "currency_name") as? String
                            break
                        }
                    }
                    
                }
                catch let error as NSError {
                    print("Data loading error: \(error)")
                    return
                }
                
                if creditTypes.contains(vc.account!.type) {
                    fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Credits")
                    
                    do {
                        let results = try managedObjectContext.fetch(fetchRequest)
                        
                        for data in results as! [NSManagedObject] {
                            let id = data.value(forKey: "account_id") as! Int
                            
                            if id == vc.account!.id {
                                vc.account!.percent = data.value(forKey: "percent") as? Double
                                break
                            }
                        }
                        
                    }
                    catch let error as NSError {
                        print("Data loading error: \(error)")
                        return
                    }
                }
            }
        }
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

