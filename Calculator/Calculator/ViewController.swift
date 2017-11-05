//
//  ViewController.swift
//  Calculator
//
//  Created by Danil on 31.10.17.
//  Copyright © 2017 Danil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var displayLabel: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = self.displayLabel.text!
            displayLabel.text = textCurrentlyInDisplay + digit
        } else {
            displayLabel.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    private var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performAction(_ sender: UIButton) {
        
        if userIsInTheMiddleOfTyping
        {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if userIsInTheMiddleOfTyping == false
        {
            if let mathematicalSymbol = sender.currentTitle
            {
                brain.performAction(symbol: mathematicalSymbol)
            }
            displayValue = brain.result
        }
        
        
        
        
        
        
        
        
        
        
        
        /*
        userIsInTheMiddleOfTyping = false
        
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "П":
                displayValue = Double.pi
            case "√":
                let operand = Double(displayLabel!.text!)!
                displayValue = sqrt(operand)
            default:
                break
            }
        }
 */

    }



}

