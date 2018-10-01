//
//  Operation.swift
//Project 

import Foundation
protocol AlertsDelegateProtocol { // mettre le controleur où le protocol va servir 
	func displayAlert(title: String, message: String)
}

class Operations {

	var stringNumbers: [String] = [String()]
	var operators: [String] = ["+"]
	var index = 0
	var alertDelegateProtocol : AlertsDelegateProtocol?
	func calculateTotal() {
		if !isExpressionCorrect {
			return
		}
		var total = 0
		for (i, stringNumber) in stringNumbers.enumerated() {
			if let number = Int(stringNumber) {
				if operators[i] == "+" {
					total += number
				} else if operators[i] == "-" {
					total -= number
				}
			}
		}
		//myTextView(text: UITextView.text(self))
		//textView.text = textView.text + "=\(total)"
		clear()
	}
	func addNewNumber(_ newNumber: Int) {
		if let stringNumber = stringNumbers.last {
			var stringNumberMutable = stringNumber
			stringNumberMutable += "\(newNumber)"
			stringNumbers[stringNumbers.count-1] = stringNumberMutable
			//alertExpressionCorrect(alert:  , alertAction: )
		}
		updateDisplay()

	}
	func updateDisplay() {
		var text = ""
		for (i, stringNumber) in stringNumbers.enumerated() {
			// Add operator
			if i > 0 {
				text += operators[i]
			}
			// Add number
			print("\(text)")
			text += stringNumber
			
		}
//		myTextView(text: text)
//		textView.text = text
	}
	
	func clear() {
		stringNumbers = [String()]
		operators = ["+"]
		index = 0
	}
	var isExpressionCorrect: Bool {
		if let stringNumber = stringNumbers.last {
			if stringNumber.isEmpty {
				if stringNumbers.count == 1 {
					alertDelegateProtocol?.displayAlert(title: "Zéro!", message: "démarrez un nouveau Calcul")
					//	                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
					//	                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
					//	                    self.present(alertVC, animated: true, completion: nil)
				} else {
					alertDelegateProtocol?.displayAlert(title: "Zéro!", message: "Entrez une expression correcte !")
					//	                    let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
					//	                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
					//self.present(alertVC, animated: true, completion: nil)
				}
				return false
			}
		}
		return true
	}
	var canAddOperator: Bool {
		if let stringNumber = stringNumbers.last {
			if stringNumber.isEmpty {
				//alertDelegate.alertExpressionCorrect
				//present(self, animated: true, completion: nil)
				alertDelegateProtocol?.displayAlert(title: "Zéro!", message: "Entrez une expression correcte !")
//				let alertVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//				alertVC.alertDelegate = self
//
//				present(alertVC, animated: true, completion: nil)
//				alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
				//
			//	self.present(alertVC, animated: true, completion: nil)
				return false
			}
		}
		return true
	}
	
	func addButton() {
		if canAddOperator {
			operators.append("+")
			stringNumbers.append("")
		}
		updateDisplay()
	}
	
	func minusButton() {
		if canAddOperator {
			operators.append("-")
			stringNumbers.append("")
		}
		updateDisplay()
	}

}
//extension Operations: AlertsDelegateProtocol {
//	func alertNewCalcul(alert: UIAlertController, alertAction: UIAlertAction) {
//		<#code#>
//	}
//
//	func alertExpressionCorrect(alert: UIAlertController, alertAction: UIAlertAction) {
//		<#code#>
//	}
//
//	func alertIncorrectExpression(alert: UIAlertController, alertAction: UIAlertAction) {
//		<#code#>
//	}
//
//	func myTextView(text: UITextView) {
//		<#code#>
//	}
//
//
//}


