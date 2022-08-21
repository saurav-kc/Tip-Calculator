//
//  TipCalculator.swift
//  Tip Calculator
//
//  Created by SAURAV on 8/20/2022.
//  Copyright © 2022 SAURAV. All rights reserved.
//

import Foundation

class TipCalculator {
  var billAmount: Double = 0
  var tipAmount: Double = 0
  var tipPercentage: Double = 0
  var totalCharge: Double = 0
  
  init(billAmount: Double, tipPercentage: Double) {
    self.billAmount = billAmount
    self.tipPercentage = tipPercentage
  }
  
  func calculateTip() {
    tipAmount = billAmount * Double(tipPercentage)
    totalCharge = tipAmount + billAmount
  }

}
