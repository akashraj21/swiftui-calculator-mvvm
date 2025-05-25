//
//  CalculatorModel.swift
//  CalculatorApp
//
//  Created by Garfield_akash on 25/05/2025.
//

import Foundation

enum Operation {
    case add, subtract, multiply, divide
}

struct CalculatorModel {
    var display: String = "0"
    var firstOperand: Double?
    var currentOperation: Operation?
    var isTyping: Bool = false
}

