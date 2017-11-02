//
//  ViewController.swift
//  Calculator
//
//  Created by Danil on 31.10.17.
//  Copyright © 2017 Danil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var userIsInTheMiddleOfTyping = false

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = self.displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        } else {
            displayLabel.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    @IBAction func performAction(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "П":
                displayValue = Double.pi
                
            case "√":
                let operand = Double(displayLabel!.text!)!
                displayValue = sqrt(operand)
            case "123":
                print("хуй")
            default:
                break
            }
        }
    }



}

