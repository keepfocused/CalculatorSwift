//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Admin on 06.11.17.
//  Copyright © 2017 Danil. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    mutating func perfromOperation(_ symbol: String) {
        switch symbol {
        case "П":
            accumulator = Double.pi
        case "√":
            if let operand = accumulator
            {
                accumulator = sqrt(operand)
            }
        default:
            break
        }
        
        
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    

}
