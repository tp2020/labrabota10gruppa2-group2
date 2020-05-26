//
//  TabViewController.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit
import CoreData

class TabbarViewController: UITabBarController {
    
    //MARK: Properties
    
    var userID: Int?
    
    //MARK: Actions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AccountTypes")
        
        var types = [Int: String]()
        
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            
            for data in results as! [NSManagedObject] {
                let name = data.value(forKey: "name") as! String
                let id = data.value(forKey: "id") as! Int
                types[id] = name
            }
            
        }
        catch let error as NSError {
            print("Data loading error: \(error)")
            return
        }
        
        fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BankAccounts")
        
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            
            var accounts = [Account]()
            
            for data in results as! [NSManagedObject] {
                let user = data.value(forKey: "user_id") as! Int
                
                if userID == user {
                    let id = data.value(forKey: "id") as! Int
                    let number = data.value(forKey: "number") as! String
                    let isBlocked = data.value(forKey: "isBlocked") as! Bool
                    let currentSum = data.value(forKey: "current_sum") as! Double
                    let currencyId = data.value(forKey: "currency_id") as! Int
                    
                    accounts.append(Account(id: id, type: types[id]!,
                        number: number, isBlocked: isBlocked,
                        currentSum: currentSum, currencyId: currencyId))
                }
            }
            
            AccountsViewController.accounts = accounts
        }
        catch let error as NSError {
            print("Data loading error: \(error)")
            return
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    

}
