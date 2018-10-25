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
					alertDelegateProtocol?.displayAlert(title: "Zéro!", message: "Démarrez un nouveau Calcul")
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

	// func for the multiplication and the division and management of calculation 's priority
	func multiplyAndDivision () {
		let priorityOperators = "*/"
		var result: Double = 0
		var i = 0
		while i < stringNumbers.count - 1{
			if var firstNumber = Double(stringNumbers[i]) {
				while priorityOperators.contains(operators[i+1]) {
					if let secondNumber = Double(stringNumbers[i+1]) {
						if operators[i+1] == "*" {
							result = firstNumber * secondNumber
						} else if operators[i+1] == "/" && secondNumber != 0 {
							result = firstNumber / secondNumber
						} else {
							alertDelegateProtocol?.displayAlert(title: "Erreur", message: "La division par zéro est impossible.")
						}
						stringNumbers[i] = String(result)
						firstNumber = result
						stringNumbers.remove(at: i+1)
						operators.remove(at: i+1)
						if i == stringNumbers.count - 1 {
							return
						}
					}
				}
				i += 1
			}
		}
	}
	// func to execution of operations and addition of a format with two decimal places
	func calculateTotal() -> String {
		if !isExpressionCorrect {
			return "0"
		}
		var total:Double = 0
		multiplyAndDivision()
		for (i, stringNumber) in stringNumbers.enumerated() {
			if let number = Double(stringNumber) {
					if operators[i] == "+" {
						total += number
					} else if operators[i] == "-" {
						total -= number
					}
			}
		}
		let result = String(format: "%.2f", total)
		clear()
		return result
	}
	// 
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



//func calculateTotal() -> String {
//	if !isExpressionCorrect {
//		return "0"
//	}
//	var totalToString = ""
//	var total = 0
//	var totalToStringToDouble:Double = 0.0
//	var numberToFloatNumber:Double = 0.0
//
//	for (i, stringNumber) in stringNumbers.enumerated() {
//		if let number = Int(stringNumber) {
//			if operators[i] == "+" {
//				total += number
//			} else if operators[i] == "-" {
//				total -= number
//			} else if operators[i] == "*" {
//				if priorityCalculMultiply {
//					total *= number
//				}
//				print("priority de calcul : \(priorityCalculMultiply)")
//			} else if operators[i] == "/" {
//				if !divisionByZero {
//					return totalToString
//				} else {
//					totalToStringToDouble = Double(total)
//					numberToFloatNumber = Double(number)
//					totalToStringToDouble /= numberToFloatNumber
//					totalToString = String(format: "%.2f", totalToStringToDouble)
//					return totalToString
//				}
//			}
//			totalToString = String(total)
//		}
//	}
//	return totalToString
//}
//	var divisionByZero: Bool {
//		if stringNumbers.last != nil{
//			if operators.last == "/" {
//				if stringNumbers.last == "0" {
//					alertDelegateProtocol?.displayAlert(title: "Erreur", message: "La division par zéro est impossible.")
//					return false
//				}
//			}
//		}
//		return true
//	}

//	var priorityCalculMultiply: Bool {
//		var numbersMultiply = [String]()
//		var numberAfter = ""
////		var numberBefore = ""
////		if stringNumbers.last != nil {
//			//	var test = operators.index(after: -1)
//				for i in 0..<operators.count {
//					let indexOperators = operators[i]
//					if indexOperators == "*"  {
//						for i in 0..<stringNumbers.count {
//							let numbersPriority = stringNumbers[i]
//							//var numbersPriorityToInt =
//							if Int(numbersPriority) != nil {
//								//if numbersPriorityToInt! >= 1 {
//								//let myTest = stringNumbers[i-1]
//								var numberBefore = stringNumbers.index(before: stringNumbers.endIndex)
//								var numberAfter  = stringNumbers.index(after: stringNumbers.endIndex)
//								//									print("test 3 :\(stringNumbers[numberBefore])")
//								let numbersPriority2 = stringNumbers[i]
//								var test3 = Int(numbersPriority2)
//								var test4 = Int(indexOperators)
//								print("position numbers \(numbersPriority2)")
//								print("position operators\(indexOperators)")
//
//							}
//
//						}
//					}
//
//				}
//		return true
//
//	}
//		return true
//		for (i, operators ) in operators.enumerated() {
//			print("===============================")
//			print("my operators\(i) \(operators)")
//			print("===============================")
//			while operators[i] ==
//				for i in 0..<stringNumbers.count {
//					let test = stringNumbers[i]
//					print("\(test.index(after: $. ) )")
//				}
//		}
//		for (j, stringNumber ) in stringNumbers.enumerated() {
//
//			print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
//			print("my stringNumbers\(j) \(operators)")
//			print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
//		}
//		return true
//	}
