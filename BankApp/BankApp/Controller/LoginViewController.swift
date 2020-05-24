//
//  LoginViewController.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    //MARK: Properties
    
    let defaults = UserDefaults.standard

    struct Keys {
        static let login = "login"
        static let password = "password"
        static let email = "email"
    }
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var hasAgreement = false
    var userID = 0
    
    var alertTitle = "Fail"
    var alertMessage = "You typed incorrect data"
    
    //MARK: View actions

    override func viewDidLoad() {
        super.viewDidLoad()

        if defaults.object(forKey: Keys.login) != nil && defaults.object(forKey: Keys.password) != nil {
            loginTextField.text = defaults.object(forKey: Keys.login) as? String
            passwordTextField.text = defaults.object(forKey: Keys.password) as? String
        }
    }
    
    func confirmAccount() -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            for data in results as! [NSManagedObject] {
                
                if data.value(forKey: Keys.login) as? String == loginTextField.text {
                    if data.value(forKey: Keys.password) as? String == passwordTextField.text {
                        userID = data.value(forKey: "id") as! Int
                        return true
                    }
                }
            }
        }
        catch let error as NSError {
            print("Data loading error: \(error)")
        }
        
        return false
    }
    
    func showAlert() {
        let alertView = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        if loginTextField.text != "" && passwordTextField.text != "" {
            if confirmAccount() {
                performSegue(withIdentifier: "showMainMenu", sender: sender)
            }
            else {
                showAlert()
            }
        }
    }
    
    @IBAction func stateChanged(_ sender: Any) {
        if signUpView.isHidden {
            signUpView.isHidden = false
        }
        else {
            signUpView.isHidden = true
        }
    }
    
    @IBAction func agreementChange(_ sender: Any) {
        if hasAgreement {
            hasAgreement = false
        }
        else {
            hasAgreement = true
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        defaults.setValue(loginTextField.text, forKey: Keys.login)
        defaults.setValue(passwordTextField.text, forKey: Keys.password)
        
        if let vc = segue.destination as? UITabBarController {
            (vc as! TabbarViewController).userID = userID
        }
    }

}
