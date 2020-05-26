//
//  Account.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import Foundation

struct Account {
    var id: Int
    
    var type: String
    var number: String
    var isBlocked: Bool
    var currentSum: Double
    
    var percent: Double?
    var currencyId: Int
    var currencyName: String?
    
    var issueDate: String?
    var validityTo: String?
    
    init(id: Int, type: String, number: String, isBlocked: Bool,
         currentSum: Double, currencyId: Int) {
        self.id = id
        self.type = type
        self.number = number
        self.isBlocked = isBlocked
        self.currentSum = currentSum
        self.currencyId = currencyId
    }
}
