//
//  Operation.swift
//Chnage to notification

import Foundation
class Operations: ViewController {

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
					
					//	                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
					//	                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
					//	                    self.present(alertVC, animated: true, completion: nil)
				} else {
					
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
				let alertVC = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
				alertVC.alertDelegate = self
					present(alertVC, animated: true, completion: nil) as! Alerts
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
	

