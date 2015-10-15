//
//  money.swift
//  domain-modeling
//
//  Created by Yuyang Fan on 10/13/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import Foundation

struct Money {
    var currency : String
    var amount : Double
    
    // coverts current currency to the given currency type
    func convertTo(targetCurrency: String) -> Money{
        var result = Money(currency: targetCurrency, amount: self.amount)
        switch self.currency {
            case "USD":
                if (targetCurrency == "GBP") {
                    result.amount = self.amount * 0.5
                  
                }else if (targetCurrency == "EUR"){
                    result.amount = self.amount * 1.5
                }else if (targetCurrency == "CAN") {
                    result.amount = self.amount * 1.25
                }else {
                    print("Cannot convert to this currency.")
                }
            
            case "GBP":
                if (targetCurrency == "USD") {
                    result.amount = self.amount * 2
                }else if (targetCurrency == "EUR"){
                    result.amount = self.amount * 3
                }else if (targetCurrency == "CAN") {
                    result.amount = self.amount * 2.5
                }else {
                    print("Cannot convert to this currency.")
            }
            
            case "EUR":
                if (targetCurrency == "GBP") {
                    result.amount = self.amount * (1/3)
                }else if (targetCurrency == "USD"){
                    result.amount = self.amount * (2/3)
                }else if (targetCurrency == "CAN") {
                    result.amount = self.amount * (5/6)
                }else {
                    print("Cannot convert to this currency.")
            }
            
            case "CAN":
                if (targetCurrency == "GBP") {
                    result.amount = self.amount * (2/5)
                }else if (targetCurrency == "EUR"){
                    result.amount = self.amount * (6/5)
                }else if (targetCurrency == "USD") {
                    result.amount = self.amount * (4/5)
                }else {
                    print("Cannot convert to this currency.")
            }
            default:
                result.amount = self.amount
                result.currency = self.currency
        }
        
        return result
    }
    
    // coverts the given Money to current currency and returns the sum
    func add(incoming: Money) -> Money{
        var total = Money(currency: self.currency, amount: self.amount)
        let coveredIncoming = incoming.convertTo(self.currency)
        total.amount = self.amount + coveredIncoming.amount
        
        return total
    }
    
    // coverts the given Money to current currency and returns the subtract result
    func subtract(incoming: Money) -> Money{
        var total = Money(currency: self.currency, amount: self.amount)
        let coveredIncoming = incoming.convertTo(self.currency)
        total.amount = self.amount - coveredIncoming.amount
        
        return total
    }
    
}