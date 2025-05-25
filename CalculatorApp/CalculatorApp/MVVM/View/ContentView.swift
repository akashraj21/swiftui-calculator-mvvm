//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Garfield_akash on 25/05/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    let buttonRows: [[CalcButton]] = [
        [.clear, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equals]
    ]

    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text(viewModel.displayText)
                .font(.system(size: 64))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()

            ForEach(buttonRows, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            viewModel.handleTap(button)
                        }) {
                            Text(button.title)
                                .font(.system(size: 32))
                                .frame(width: buttonWidth(button), height: buttonHeight())
                                .background(button.backgroundColor)
                                .foregroundColor(.white)
                                .cornerRadius(buttonWidth(button) / 2)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    private func buttonWidth(_ button: CalcButton) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return button == .zero ? ((screenWidth - 5 * 12) / 4) * 2 + 12 : (screenWidth - 5 * 12) / 4
    }

    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}


#Preview {
    ContentView()
}
