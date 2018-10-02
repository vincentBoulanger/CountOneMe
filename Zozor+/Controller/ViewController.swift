//
//  ViewController.swift
//test 32

import UIKit

class ViewController: UIViewController {
	// viewTest
	// MARK: - Outlets
	@IBOutlet weak var textView: UITextView!
	@IBOutlet var numberButtons: [UIButton]!
	let operations = Operations()
    // MARK: - Properties
	 // delegateur

    // MARK: - Action
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
             textView.text = operations.addNewNumber(i)
				textView.text = operations.updateDisplay()
            }
        }
    }
	@IBAction func operationButtonTapped(_ sender: UIButton) {
		switch sender.title(for: .normal) {
			case "+":
				print("addButton in ViewController")
				textView.text = operations.plusActionButton()
				textView.text = operations.updateDisplay()
			case "-":
				print("minusButton in ViewController")
				textView.text = operations.minusActionButton()
				textView.text = operations.updateDisplay()
			case "=":
				print("calculateTotal in ViewController")
				textView.text = operations.calculateTotal()
				operations.clear()
			default:
				break
		}
	}

    // MARK: - Methods
	override func viewDidLoad() {
		super.viewDidLoad()
		operations.alertDelegateProtocol = self // 4 implementation du protocol au sein de la classe dans laquelle on a écrit la ligne. On vient de delguer au controleur
		
	}
}

extension ViewController : AlertsDelegateProtocol {
	func displayAlert(title: String, message: String) {
		let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
		present(alertVC, animated: true, completion: nil)
	}
}
