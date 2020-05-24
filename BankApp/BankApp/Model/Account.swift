//
//  Account.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import Foundation

struct Account {
    var type: String
    var number: String
    var isBlocked: Bool
    
    init(type: String, number: String, isBlocked: Bool) {
        self.type = type
        self.number = number
        self.isBlocked = isBlocked
    }
}
