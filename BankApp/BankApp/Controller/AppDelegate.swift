//
//  AppDelegate.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //addUsers()
        //addTypes()
        //addAccounts()
        return true
    }
    
    func addAccounts() {
        guard let accountEntity = NSEntityDescription.entity(forEntityName: "BankAccounts", in: persistentContainer.viewContext) else {
            fatalError()
        }
        
        let current = NSManagedObject(entity: accountEntity, insertInto: persistentContainer.viewContext)
        
        current.setValue(1, forKey: "id")
        current.setValue(1, forKey: "user_id")
        current.setValue(1, forKey: "type_id")
        current.setValue("1111 1111 1111", forKey: "number")
        current.setValue(false, forKey: "isBlocked")
        
        let savings = NSManagedObject(entity: accountEntity, insertInto: persistentContainer.viewContext)
        
        savings.setValue(2, forKey: "id")
        savings.setValue(1, forKey: "user_id")
        savings.setValue(2, forKey: "type_id")
        savings.setValue("2222 2222 2222", forKey: "number")
        savings.setValue(true, forKey: "isBlocked")
        
        let credit = NSManagedObject(entity: accountEntity, insertInto: persistentContainer.viewContext)
        
        credit.setValue(3, forKey: "id")
        credit.setValue(1, forKey: "user_id")
        credit.setValue(3, forKey: "type_id")
        credit.setValue("3333 3333 3333", forKey: "number")
        credit.setValue(true, forKey: "isBlocked")
        
        let salary = NSManagedObject(entity: accountEntity, insertInto: persistentContainer.viewContext)
        
        salary.setValue(4, forKey: "id")
        salary.setValue(1, forKey: "user_id")
        salary.setValue(4, forKey: "type_id")
        salary.setValue("4444 4444 4444", forKey: "number")
        salary.setValue(false, forKey: "isBlocked")
        
        let savingsCard = NSManagedObject(entity: accountEntity, insertInto: persistentContainer.viewContext)
        
        savingsCard.setValue(5, forKey: "id")
        savingsCard.setValue(1, forKey: "user_id")
        savingsCard.setValue(5, forKey: "type_id")
        savingsCard.setValue("5555 5555 5555", forKey: "number")
        savingsCard.setValue(false, forKey: "isBlocked")
        
        let creditCard = NSManagedObject(entity: accountEntity, insertInto: persistentContainer.viewContext)
        
        creditCard.setValue(6, forKey: "id")
        creditCard.setValue(1, forKey: "user_id")
        creditCard.setValue(6, forKey: "type_id")
        creditCard.setValue("6666 6666 6666", forKey: "number")
        creditCard.setValue(true, forKey: "isBlocked")
        
        saveContext()
    }
    
    func addTypes() {
        guard let typeEntity = NSEntityDescription.entity(forEntityName: "AccountTypes", in: persistentContainer.viewContext) else {
            fatalError()
        }
        
        let current = NSManagedObject(entity: typeEntity, insertInto: persistentContainer.viewContext)
        
        current.setValue(1, forKey: "id")
        current.setValue("Текущий", forKey: "name")
        
        let savings = NSManagedObject(entity: typeEntity, insertInto: persistentContainer.viewContext)
        
        savings.setValue(2, forKey: "id")
        savings.setValue("Сберегательный", forKey: "name")
        
        let credit = NSManagedObject(entity: typeEntity, insertInto: persistentContainer.viewContext)
        
        credit.setValue(3, forKey: "id")
        credit.setValue("Кредитный", forKey: "name")
        
        let salary = NSManagedObject(entity: typeEntity, insertInto: persistentContainer.viewContext)
        
        salary.setValue(4, forKey: "id")
        salary.setValue("Зарплатный карт-счёт", forKey: "name")
        
        let savingsCard = NSManagedObject(entity: typeEntity, insertInto: persistentContainer.viewContext)
        
        savingsCard.setValue(5, forKey: "id")
        savingsCard.setValue("Сберегательный карт-счёт", forKey: "name")
        
        let creditCard = NSManagedObject(entity: typeEntity, insertInto: persistentContainer.viewContext)
        
        creditCard.setValue(6, forKey: "id")
        creditCard.setValue("Кредитный карт-счёт", forKey: "name")
        
        saveContext()
    }
    
    func addUsers() {
        guard let userEntity = NSEntityDescription.entity(forEntityName: "Users", in: persistentContainer.viewContext) else {
            fatalError()
        }
        
        let user = NSManagedObject(entity: userEntity, insertInto: persistentContainer.viewContext)
        
        user.setValue(1, forKey: "id")
        user.setValue("Elisaveta", forKey: "name")
        user.setValue("example", forKey: "login")
        user.setValue("123", forKey: "password")
        
        saveContext()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "BankApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

