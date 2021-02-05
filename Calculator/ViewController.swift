//
//  ViewController.swift
//  Calculator
//
//  Created by Muzhi Zhang on 2/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var partySizeStepper: UIStepper!
    
    @IBOutlet weak var partySizeField: UITextField!
    
    @IBOutlet weak var eachPersonLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func calculateTip () {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get tip percentages
        let tipPercentages = [0.15, 0.18, 0.2]
        
        //Get Total tip by multiplying tip and tip Percentage
        let tipPercentageSelected = tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * tipPercentageSelected
        
        //Get party size
        var partySize = Double(partySizeField.text!) ?? 1
        if partySize < 1 {
            partySize = 1
        }
        
        //Calculate total and total per person
        let total = bill + tip
        let totalPerPerson = total / partySize
        
        //Update text fields
        tipAmountLabel.text = String(format: "$ %.2f", tip)
        totalLabel.text = String(format: "$ %.2f", total)
        eachPersonLabel.text = String(format: "$ %.2f", totalPerPerson)
    }
    
    @IBAction func billAmountChange(_ sender: Any) {
        calculateTip()
    }
    
    
    
    @IBAction func tipControlChange(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func partySizeEdited(_ sender: Any) {
        partySizeStepper.value = Double (partySizeField.text!) ?? 1
        calculateTip()
    }
    
    @IBAction func partySizeChange(_ sender: Any) {
        partySizeField.text = String (Int (partySizeStepper.value))
        calculateTip()
    }
    
    
}

