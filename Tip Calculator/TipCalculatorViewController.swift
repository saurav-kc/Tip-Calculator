//
//  TipCalculatorViewController.swift
//  Tip Calculator
//
//  Created by SAURAV on 8/20/22.
//  Copyright © 2022 SAURAV. All rights reserved.
//

import UIKit

class TipCalculatorViewController:UIViewController{
  @IBOutlet weak var billAmount:UITextField!
  @IBOutlet weak var totalCharge:UILabel!
  @IBOutlet weak var tipPercentS:UISlider?
  @IBOutlet weak var split:UIStepper?
  @IBOutlet weak var splitted:UILabel!
  @IBOutlet weak var tipPercent:UILabel!
  @IBOutlet weak var splittedAmount:UILabel!
  @IBOutlet weak var totalTips:UILabel!
  
  var tipCalculator = TipCalculator(billAmount: 0, tipPercentage: 15)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    billAmount.becomeFirstResponder()
  }
  
  func calculate(){
    tipCalculator.tipPercentage = Double((tipPercentS?.value)! / 100.0)
    tipCalculator.billAmount = (billAmount.text! as NSString).doubleValue
    tipCalculator.calculateTip()
    updateUI()
  }
  
  func updateUI(){
    totalCharge.text = String(format: "%0.2f", tipCalculator.totalCharge)
    let numberOfPeople: Int = Int((split?.value)!)
    splittedAmount.text = String(format: "$%0.2f", tipCalculator.totalCharge / Double(numberOfPeople))
    totalTips.text = String(format: "%.2f%", tipCalculator.tipAmount)
  }
  
  // Slider changes
  
  @IBAction func tipSliderValueChanged(sender: Any){
    tipPercent.text = String( format: "%.2f%%", tipPercentS!.value )
    calculate()
  }
  
  @IBAction func splittedChanged(sender: Any){
    splitted.text = String( Int(split?.value ?? 1) )
    calculate()
  }
  
  @IBAction func billAmountChanged(sender: Any){
    billAmount.text = String( billAmount.text! as NSString )
    calculate()
    updateUI()
  }
}
