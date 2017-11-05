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
    
    var operations: Dictionary<String,Operation> = [
        "П" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos)
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation
        case Equals
    }
    
    
    func performAction(symbol: String)
    {
        
        if let operation = operations[symbol]
        {
            switch operation
            {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation: break
            case .Equals: break
            }
        }
        
//        if let constant = operations[symbol] {
//            accumulator = constant
//
//        }
        
        
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
