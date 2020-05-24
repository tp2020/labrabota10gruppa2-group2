//
//  SecondViewController.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController,
    ExchangeRatesGetterDelegate {

    //MARK: Properties
    
    var exchangeRatesGetter : ExchangeRatesGetter!
    var exchangeRates : ExchangeRates!
    
    @IBOutlet weak var eurRateTA: UITextField!
    @IBOutlet weak var usdRateTA: UITextField!
    @IBOutlet weak var bynRateTA: UITextField!
    
    @IBOutlet weak var modeControl: UISegmentedControl!
    
    //MARK: View actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exchangeRatesGetter = ExchangeRatesGetter(delegate: self)
        exchangeRatesGetter.getExchangeRates()
    }
     
    //MARK: Rate getter actions
    
    func didGetRates(exchangeRates: ExchangeRates) {
        self.exchangeRates = exchangeRates
        
        DispatchQueue.main.async() {
            self.usdRateTA.text = "1.0"
            self.eurRateTA.text = String(format: "%.4f", Double(exchangeRates.usd_out)! / Double(exchangeRates.eur_out)!)
            self.bynRateTA.text = self.exchangeRates.usd_out
        }
    }
    
    func didNotGetRates(error: NSError) {
        print("didNotGetRates error: \(error)")
    }
    
    //MARK: Text fields actions
    
    @IBAction func modeDidChanged(_ sender: Any) {
        var usd: Double
        var eur: Double
        
        if modeControl.selectedSegmentIndex == 0 {
            usd = Double(exchangeRates.usd_out)!
            eur = Double(exchangeRates.eur_out)!
        }
        else {
            usd = Double(exchangeRates.usd_in)!
            eur = Double(exchangeRates.eur_in)!
        }
        
        bynRateTA.text = String(format: "%.4f", 1.0 * usd)
        eurRateTA.text = String(format: "%.4f", usd / eur)
    }
    
    @IBAction func usdEditingEnd(_ sender: Any) {
        let sum = Double(usdRateTA.text!)
        var usd: Double
        var eur: Double
        
        if modeControl.selectedSegmentIndex == 0 {
            usd = Double(exchangeRates.usd_out)!
            eur = Double(exchangeRates.eur_out)!
        }
        else {
            usd = Double(exchangeRates.usd_in)!
            eur = Double(exchangeRates.eur_in)!
        }
        
        bynRateTA.text = String(format: "%.4f", sum! * usd)
        eurRateTA.text = String(format: "%.4f", (sum! * usd) / eur)
    }
    
    @IBAction func eurEditingEnd(_ sender: Any) {
        let sum = Double(eurRateTA.text!)
        var usd: Double
        var eur: Double
        
        if modeControl.selectedSegmentIndex == 0 {
            usd = Double(exchangeRates.usd_out)!
            eur = Double(exchangeRates.eur_out)!
        }
        else {
            usd = Double(exchangeRates.usd_in)!
            eur = Double(exchangeRates.eur_in)!
        }
        
        bynRateTA.text = String(format: "%.4f", sum! * eur)
        usdRateTA.text = String(format: "%.4f", (sum! * eur) / usd)
    }
    
    @IBAction func bynEditingEnd(_ sender: Any) {
        let sum = Double(bynRateTA.text!)
        var usd: Double
        var eur: Double
        
        if modeControl.selectedSegmentIndex == 0 {
            usd = Double(exchangeRates.usd_out)!
            eur = Double(exchangeRates.eur_out)!
        }
        else {
            usd = Double(exchangeRates.usd_in)!
            eur = Double(exchangeRates.eur_in)!
        }
        
        eurRateTA.text = String(format: "%.4f", sum! / eur)
        usdRateTA.text = String(format: "%.4f", sum! / usd)
    }
}

