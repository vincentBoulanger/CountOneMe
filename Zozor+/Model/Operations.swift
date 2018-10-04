//
//  Operation.swift
//Project 

import Foundation
protocol AlertsDelegateProtocol { // 1. declaration du protocol
	func displayAlert(title: String, message: String)
}

class Operations {
	var stringNumbers: [String] = [String()]
	var operators: [String] = ["+"]
	var alertDelegateProtocol : AlertsDelegateProtocol?// 2. initialisation du protocol
	
	var isExpressionCorrect: Bool {
		if let stringNumber = stringNumbers.last {
			if stringNumber.isEmpty {
				if stringNumbers.count == 1 {
					alertDelegateProtocol?.displayAlert(title: "Zéro!", message: "démarrez un nouveau Calcul")
				} else {
					alertDelegateProtocol?.displayAlert(title: "Zéro!", message: "Entrez une expression correcte !")
				}
				return false
			}
		}
		return true
	}
	var canAddOperator: Bool {
		if let stringNumber = stringNumbers.last {
			if stringNumber.isEmpty {
				alertDelegateProtocol?.displayAlert(title: "Zéro!", message: "Entrez une expression correcte, non vide !")
				return false
			}
		}
		return true
	}
	func calculateTotal() -> String {
		var total = 0
		var totalToString = ""
		if !isExpressionCorrect {
			return totalToString
		}
		for (i, stringNumber) in stringNumbers.enumerated() {
			if let number = Int(stringNumber) {
				if operators[i] == "+" {
					total += number
					totalToString = String(total)
				} else if operators[i] == "-" {
					total -= number
					totalToString = String(total)
				} else if operators[i] == "*" {
					total *= number
					totalToString = String(total)
				} else if operators[i] == "/" {
					total /= number
					totalToString = String(total)
				}
			}
		}
		return totalToString
	}
	func addNewNumber(_ newNumber: Int)  -> String {
		if let stringNumber = stringNumbers.last {
			var stringNumberMutable = stringNumber
			stringNumberMutable += "\(newNumber)"
			stringNumbers[stringNumbers.count-1] = stringNumberMutable
		}
		return String(newNumber)
	}
	func updateDisplay() -> String {
		var text = ""
		for (i, stringNumber) in stringNumbers.enumerated() {
			// Add operator
			if i > 0 {
				text += operators[i]
			}
			// Add number
			text += stringNumber
		}
		return text
	}
	
	func clear(){
		stringNumbers = [String()]
		operators = ["+"]
	}
	
	func plusActionButton() -> String {
		if canAddOperator {
			operators.append("+")
			stringNumbers.append("")
		}
		return updateDisplay()
	}
	
	func minusActionButton() -> String {
		if canAddOperator {
			operators.append("-")
			stringNumbers.append("")
		}
		return updateDisplay()
	}
	
	func multiplyActionButton() -> String {
		if canAddOperator {
			operators.append("*")
			stringNumbers.append("")
		}
		return updateDisplay()
	}
	func divideActionButton() -> String {
		if canAddOperator {
			operators.append("/")
			stringNumbers.append("")
		}
		return updateDisplay()
	}
}



