//
//  SecondViewController.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, ExchangeRatesGetterDelegate, CoordinatesGetterDelegate {

    var exchangeRatesGetter : ExchangeRatesGetter!
    var coordinatesGetter : CoordinateGetter!
    
    var exchangeRates : ExchangeRates!
    
    @IBOutlet weak var eurRateTA: UITextField!
    @IBOutlet weak var usdRateTA: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exchangeRatesGetter = ExchangeRatesGetter(delegate: self)
        coordinatesGetter = CoordinateGetter(delegate: self)
        exchangeRatesGetter.getExchangeRates()
        coordinatesGetter.getCoordinates()
    }
     
    func didGetCoordinates(coordinates: Coordinates) {
        MapViewController.coordinates = coordinates
    }
    
    func didNotGetCoordinates(error: NSError) {
        print("didNotGetCoordinates error: \(error)")
    }
    
    func didGetRates(exchangeRates: ExchangeRates)
    {
        self.exchangeRates = exchangeRates
        DispatchQueue.main.async() {
            self.eurRateTA.text = self.exchangeRates.eur_out
            self.usdRateTA.text = self.exchangeRates.usd_out
        }
    }
    
    func didNotGetRates(error: NSError)
    {
        print("didNotGetRates error: \(error)")
    }
    


}

