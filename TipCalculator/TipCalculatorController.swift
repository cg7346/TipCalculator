//
//  TipCalculatorController.swift
//  TipCalculator
//
//  Created by Celeste Gambardella on 7/20/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class TipCalculatorController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
  
    @IBOutlet weak var peopleLabel: UILabel!
    
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var perPersonTipLabel: UILabel!
    
    @IBOutlet weak var perPersonTotalLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        perPersonTipLabel.isHidden = true
        perPersonTotalLabel.isHidden = true

    }
    
    // assign functionality of stepper to label
    @IBAction func peopleStepper(_ sender: UIStepper) {
        peopleLabel.text = String(format: "%.0f", sender.value)
    }

    // dismiss keyboard
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: Any) {
        
        peopleStepper(stepper)
        
        // Get the number of people to split the bill with
        let people = Double(peopleLabel.text!) ?? 1

        
        // Show or hide per person label
        if people == 1 {
            perPersonTipLabel.isHidden = true
            perPersonTotalLabel.isHidden = true

        } else if people > 1 {
            perPersonTipLabel.isHidden = false
            perPersonTotalLabel.isHidden = false
        }
        
        
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        
        let tip = (bill * tipPercentages[tipControl.selectedSegmentIndex]) / people
        let total = (bill / people) + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    
    }

}
