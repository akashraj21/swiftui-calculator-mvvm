//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Garfield_akash on 25/05/2025.
//

import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published private(set) var displayText: String = "0"

    private var model = CalculatorModel()

    func handleTap(_ button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide:
            setOperation(button)
        case .equals:
            calculateResult()
        case .clear:
            reset()
        case .decimal:
            addDecimal()
        case .plusMinus:
            toggleSign()
        case .percent:
            applyPercent()
        default:
            handleNumber(button)
        }
    }

    private func handleNumber(_ button: CalcButton) {
        if model.isTyping {
            model.display += button.title
        } else {
            model.display = button.title
            model.isTyping = true
        }
        updateDisplay()
    }

    private func setOperation(_ button: CalcButton) {
        model.firstOperand = Double(model.display)
        model.isTyping = false

        switch button {
        case .add: model.currentOperation = .add
        case .subtract: model.currentOperation = .subtract
        case .multiply: model.currentOperation = .multiply
        case .divide: model.currentOperation = .divide
        default: break
        }
    }

    private func calculateResult() {
        guard let operation = model.currentOperation,
              let first = model.firstOperand,
              let second = Double(model.display) else { return }

        var result: Double = 0
        switch operation {
        case .add: result = first + second
        case .subtract: result = first - second
        case .multiply: result = first * second
        case .divide: result = second != 0 ? first / second : 0
        }

        model.display = String(result)
        updateDisplay()
        model.isTyping = false
        model.currentOperation = nil
        model.firstOperand = nil
    }

    private func reset() {
        model = CalculatorModel()
        updateDisplay()
    }

    private func addDecimal() {
        if !model.display.contains(".") {
            model.display += "."
            model.isTyping = true
            updateDisplay()
        }
    }

    private func toggleSign() {
        if let value = Double(model.display) {
            model.display = String(-value)
            updateDisplay()
        }
    }

    private func applyPercent() {
        if let value = Double(model.display) {
            model.display = String(value / 100)
            updateDisplay()
        }
    }

    private func updateDisplay() {
        displayText = model.display
    }
}
