//
//  Model.swift
//  QwikTip Calculator
//
//  Created by John Piccione on 9/30/19.
//  Copyright © 2019 John Piccione. All rights reserved.
//

import Foundation

class Model {
    
    
    var subtotalFromTextField = "0.00"
    var tipPercentFromSlider = 15
    var stepperCountLabel = 1
    
    
    
    // MARK: - Decimals for Calculation
    var subtotalAsDecimal: NSDecimalNumber {
        return (NSDecimalNumber(string: subtotalFromTextField) ) 
    }
    
    var tipPercent: NSDecimalNumber {
        return NSDecimalNumber(value: Double(tipPercentFromSlider)/100)
    }
    
    var tipAmount: NSDecimalNumber {
        return subtotalAsDecimal.multiplying(by: tipPercent)
    }
    
    var totalAmount: NSDecimalNumber {
        return subtotalAsDecimal.adding(tipAmount)
    }
    
    // Gets subtotal and divides amount by the stepper count label
    var amountPerParty: NSDecimalNumber {
        return subtotalAsDecimal.dividing(by: NSDecimalNumber(value: stepperCountLabel ))
    }
    
    // Gets tip per party by dividing tip amount by stepper count label
    var tipPerParty: NSDecimalNumber {
        return tipAmount.dividing(by: NSDecimalNumber(value: stepperCountLabel ))
    }
    
    
    // MARK: - Convert to Currency
    let formatter = NumberFormatter()
    
    var subtototalAsCurrency: String {
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .up
        return formatter.string(from: subtotalAsDecimal as NSDecimalNumber)!
             
    }
    
    var tipAmountAsCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: tipAmount as NSDecimalNumber)!
    }
    
    var totalAmountAsCurrency: String {
        formatter.numberStyle = .currency
        formatter.roundingMode = .up
        return formatter.string(from: totalAmount as NSDecimalNumber)!
    }
    
    var amountPerPartyAsCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: amountPerParty as NSDecimalNumber)!
    }
    
    var tipPerPartyAsCurrency: String {
        formatter.numberStyle = .currency
        return formatter.string(from: tipPerParty as NSDecimalNumber)!
    }
    
        
    
} // END
