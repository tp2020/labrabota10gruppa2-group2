//
//  LoginViewController.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Properties
    
    let defaults = UserDefaults.standard

    struct Keys {
        static let login = "login"
        static let password = "passw"
        static let email = "email"
    }
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var repeatedPasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var hasAgreement = false
    
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
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showMainMenu", sender: sender)
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
