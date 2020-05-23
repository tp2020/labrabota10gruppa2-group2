//
//  ExchangeRates.swift
//  bank_JSON
//
//  Created by Admin on 23.05.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct ExchangeRates
{
    let usd_in : String
    let usd_out : String
    let eur_in : String
    let eur_out : String
    let rub_in : String
    let rub_out : String
    
    init(exchangeData :[[String : AnyObject]])
    {
        let moneyDict = exchangeData[0]
        usd_in = moneyDict["USD_in"] as! String
        usd_out = moneyDict["USD_out"] as! String
        eur_in = moneyDict["EUR_in"] as! String
        eur_out = moneyDict["EUR_out"] as! String
        rub_in = moneyDict["RUB_in"] as! String
        rub_out = moneyDict["RUB_out"] as! String
    }
}
