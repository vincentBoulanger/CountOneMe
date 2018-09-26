//
//  ViewController.swift
//

import UIKit
protocol Alerts {
	func alertNewCalcul(alert:UIAlertController, alertAction:UIAlertAction)
	func alertExpressionCorrect(alert: UIAlertController, alertAction: UIAlertAction)
	func alertIncorrectExpression(alert: UIAlertController, alertAction: UIAlertAction)
	func myTextView(text: UITextView)
}

class ViewController: UIViewController {

	
	// MARK: - Outlets
	@IBOutlet weak var textView: UITextView!
	@IBOutlet var numberButtons: [UIButton]!
	let operations = Operations()
    // MARK: - Properties
	var alertDelegate: Alerts! // delegateur

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                addNewNumber(i)
            }
        }
    }
    @IBAction func plus() {
		operations.addButton()
		operations.updateDisplay()
    }

    @IBAction func minus() {
		operations.minusButton()
		operations.updateDisplay()
    }

    @IBAction func equal() {
        operations.calculateTotal()
    }

    // MARK: - Methods

    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = operations.stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            operations.stringNumbers[operations.stringNumbers.count-1] = stringNumberMutable
			//alertExpressionCorrect(alert:  , alertAction: )
        }
        operations.updateDisplay()
    }

}
extension ViewController: Alerts {
	
	func myTextView(text: UITextView) {
		print("myTextView ")
	}

	func alertNewCalcul(alert: UIAlertController, alertAction: UIAlertAction) {
		print("myAlertNewCalcul")
		//self.present(alert, animated: true, completion: nil)
		alertDelegate.alertNewCalcul(alert: .init(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert), alertAction: .init(title: "Ok", style: .cancel, handler: nil))
		dismiss(animated: true, completion: nil)
	}

	func alertExpressionCorrect(alert: UIAlertController, alertAction: UIAlertAction) {
		print("myAlertExpressionCorrect")
		alertDelegate.alertExpressionCorrect(alert: .init(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert), alertAction: .init(title: "Zéro !", style: .cancel, handler: nil) )
		dismiss(animated: true, completion: nil)
	}

	func alertIncorrectExpression(alert: UIAlertController, alertAction: UIAlertAction) {
		print("myAlertIncorrectExpression")
		alertDelegate.alertExpressionCorrect(alert: .init(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert), alertAction: .init(title: "Ok", style: .cancel, handler: nil))
		dismiss(animated: true, completion: nil)
	}
	
}
