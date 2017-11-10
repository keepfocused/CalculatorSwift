//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Admin on 06.11.17.
//  Copyright © 2017 Danil. All rights reserved.
// √

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String,Operation> =
        [
            "П" : Operation.constant(Double.pi),
            "e" : Operation.constant(M_E),
            "√" : Operation.unaryOperation(sqrt), // sqrt
            "cos" : Operation.unaryOperation(cos),
            "sin" : Operation.unaryOperation(sin),
            "±" : Operation.unaryOperation({ -$0 }),
            "×" : Operation.binaryOperation({ $0 * $1 }),
            "÷" : Operation.binaryOperation({ $0 / $1 }),
            "+" : Operation.binaryOperation({ $0 + $1 }),
            "-" : Operation.binaryOperation({ $0 - $1 }),
            "=" : Operation.equals
        ]
    
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    
    mutating func perfromOperation(_ symbol: String) {
        if let operation = operations[symbol]
        {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil
                {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
                
            case .equals:
                performPendingBinaryOperation()
            }
        }
    }
    
    private mutating func  performPendingBinaryOperation()
    {
        if pendingBinaryOperation != nil && accumulator != nil
        {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
        
        
    }
    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return  function(firstOperand, secondOperand)
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
