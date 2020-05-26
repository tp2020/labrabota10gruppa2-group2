//
//  DetailViewController.swift
//  BankApp
//
//  Created by fpmiadmin on 5/26/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: Properties
    
    var account: Account?
    
    let alertTitle = "Request has been sent"
    let alertMessage = "Please, wait until your bank give a response."
    
    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var accountNumLabel: UILabel!
    @IBOutlet weak var currentSumLabel: UILabel!
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var fromDateLabel: UILabel!
    @IBOutlet weak var toDateLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var percentView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var overdraftView: UIView!
    @IBOutlet weak var overdraftTextField: UITextField!
    @IBOutlet weak var bottomImage: UIImageView!
    @IBOutlet weak var sendButton: UIButton!
    
    //MARK: View actions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        accountNumLabel.text = account!.number
        currentSumLabel.text = String(format: "%.2f", account!.currentSum)
        accountTypeLabel.text = account!.type
        fromDateLabel.text = account!.issueDate
        toDateLabel.text = account!.validityTo
        currencyLabel.text = account!.currencyName
        
        bottomImage.image = UIImage.init(named: account!.type)
        
        if account!.isBlocked {
            statusLabel.text = "blocked"
        }
        else {
            statusLabel.text = "active"
        }
        
        if account!.percent != nil {
            percentView.isHidden = false
            percentLabel.text = String(account!.percent!) + " %"
        }
        
        if account!.type == "Salary card account" {
            overdraftView.isHidden = false
            sendButton.layer.cornerRadius = 20
        }
    }
    
    @IBAction func overdraftButtonPressed(_ sender: Any) {
        if overdraftTextField.text != "" {
            showAlert()
        }
    }
    
    func showAlert() {
        let alertView = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
