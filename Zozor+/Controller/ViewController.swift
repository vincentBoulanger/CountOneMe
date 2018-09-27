//
//  ViewController.swift
//test 32

import UIKit
protocol AlertsDelegateProtocol {
	func alertNewCalcul(alert:UIAlertController, alertAction:UIAlertAction)
	func alertExpressionCorrect(alert: UIAlertController, alertAction: UIAlertAction)
	func alertIncorrectExpression(alert: UIAlertController, alertAction: UIAlertAction)
	func myTextView(text: UITextView)
}

class ViewController: UIViewController {
	// viewTest
	// MARK: - Outlets
	@IBOutlet weak var textView: UITextView!
	@IBOutlet var numberButtons: [UIButton]!
	let operations = Operations()
    // MARK: - Properties
	var alertDelegate: AlertsDelegateProtocol! // delegateur

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
		//alertDelegate.alertExpressionCorrect(alert, alertAction: <#T##UIAlertAction#>)
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
	override func viewDidLoad() {
		super.viewDidLoad()
	
	}
}


