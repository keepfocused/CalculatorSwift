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
    
    func performAction(symbol: String)
    {
        switch symbol {
            
            case "П":accumulator = Double.pi
            case "√":accumulator = sqrt(accumulator)
        default:
            break
        }
    }
    
    var result: Double
    {
        get
        {
         return accumulator
        }
    }
    
}
