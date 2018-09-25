//
//  Operation.swift

import UIKit
class Operations {

	var stringNumbers: [String] = [String()]
	var operators: [String] = ["+"]
	var index = 0
	
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
	
	func updateDisplay() {
		var text = ""
		for (i, stringNumber) in stringNumbers.enumerated() {
			// Add operator
			if i > 0 {
				text += operators[i]
			}
			// Add number
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
					alertNewCalcul(alert: .init(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert), alertAction: .init(title: "Ok", style: .cancel, handler: nil))

					//	                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
					//	                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
					//	                    self.present(alertVC, animated: true, completion: nil)
				} else {
					alertExpressionCorrect(alert: .init(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert), alertAction: .init(title: "Zéro !", style: .cancel, handler: nil) )
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
				alertIncorrectExpression(alert: .init(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert), alertAction: .init(title: "Ok", style: .cancel, handler: nil))
				
				//present(self, animated: true, completion: nil)
//				let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
//				alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
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
	}
	
	func minusButton() {
		if canAddOperator {
			operators.append("-")
			stringNumbers.append("")
		}
	}
}

extension Operations: myAlerts {
	func myTextView(text: UITextView) {
		print("myTextView")
	}

	func alertNewCalcul(alert: UIAlertController, alertAction: UIAlertAction) {
		print("myAlertNewCalcul")
		//self.present(alert, animated: true, completion: nil)
	}
	
	func alertExpressionCorrect(alert: UIAlertController, alertAction: UIAlertAction) {
		print("myAlertExpressionCorrect")

	}
	
	func alertIncorrectExpression(alert: UIAlertController, alertAction: UIAlertAction) {
		print("myAlertIncorrectExpression")
		
	}

}
	

