//
//  CalcButton.swift
//  CalculatorApp
//
//  Created by Garfield_akash on 25/05/2025.
//

import SwiftUI

enum CalcButton: String {
    case zero = "0", one = "1", two = "2", three = "3", four = "4"
    case five = "5", six = "6", seven = "7", eight = "8", nine = "9"
    case decimal = ".", equals = "=", add = "+", subtract = "−"
    case multiply = "×", divide = "÷", clear = "AC", plusMinus = "±", percent = "%"

    var title: String { rawValue }

    var backgroundColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equals:
            return .orange
        case .clear, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return Color(.darkGray)
        }
    }
}
