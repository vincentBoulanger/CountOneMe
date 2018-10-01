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
                operations.addNewNumber(i)
            }
        }
    }
//    @IBAction func plus() { // plus Action
//		operations.addButton()
//    }
//
//    @IBAction func minus() {// minusAction
//		operations.minusButton()
//    }
//
//    @IBAction func equal() {
//        operations.calculateTotal()
//    }
	@IBAction func operationButtonTapped(_ sender: UIButton) {
		switch sender.title(for: .normal) {
		case "+":
			operations.addButton()
		case "-":
			operations.minusButton()
		case "=":
			operations.calculateTotal()
		default:
			break
		}
	}
	
    // MARK: - Methods


	override func viewDidLoad() {
		super.viewDidLoad()
		operations.alertDelegateProtocol = self
	}
}

extension ViewController : AlertsDelegateProtocol {
	func displayAlert(title: String, message: String) {
		let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
		present(alertVC, animated: true, completion: nil)
	}
}
