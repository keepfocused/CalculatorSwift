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
    @IBOutlet weak var history: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    let decimalSeparator = "."
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = self.displayLabel.text!
            
            if (digit != decimalSeparator) || !(textCurrentlyInDisplay.contains(decimalSeparator))
            {
                displayLabel.text = textCurrentlyInDisplay + digit
            }
           
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
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle
        {
            brain.perfromOperation(mathematicalSymbol)
        }
        
        if let result = brain.result
        {
            displayValue = result
        }
        
        if let description = brain.description
        {
            history.text = description + (brain.resultIsPending ? "..." : " =")
        }
        
       
    }
}

