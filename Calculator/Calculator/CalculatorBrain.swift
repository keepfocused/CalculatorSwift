//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Admin on 03.11.17.
//  Copyright © 2017 Danil. All rights reserved.
//

import Foundation

class CalculatorBrain  {
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double)
    {
        accumulator = operand
    }
    
    var operations: Dictionary<String,Double> = [
        "П" : Double.pi,
        "e" : M_E
    ]
    
    
    func performAction(symbol: String)
    {
        
        if let constant = operations[symbol] {
            accumulator = constant
            
        }
        
        
//        switch symbol {
//            
//        case "П":accumulator = Double.pi
//        case "√":accumulator = sqrt(accumulator)
//        default:
//            break
//        }
    }
    
    var result: Double
    {
        get
        {
            return accumulator
        }
    }
    
}
