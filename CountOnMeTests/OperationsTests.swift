//
//  OperationsTests.swift
//  CountOnMeTests
//
//  Created by VINCENT BOULANGER on 02/10/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//func testGivenScoreIsForty_WhenIncrementingPlayer1Score_ThenGameIsOverAndWonByPlayer1() {
//setPlayerOneScore(40)

//game.incrementScore(forPlayer: .one)
//
//XCTAssertEqual(game.winner, .one)
//XCTAssertTrue(game.isOver)
//}
// func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {}

//func testGivenScoreIsFifteen_WhenIncrementingPlayer1Score_ThenScoreShouldBeThirty() {}
//
//func testGivenScoreIsThirty_WhenIncrementingPlayer1Score_ThenScoreShouldBeForty() {}
//
//func testGivenScoreIsForty_WhenIncrementingPlayer1Score_ThenGameIsOverAndWonByPlayer1() {}


import XCTest
@testable import CountOnMe


class OperationsTests: XCTestCase {
	var operations: Operations!
	override func setUp() { // permet de réinitialiser la classe Operations pour chaque test
		super.setUp()
		operations = Operations()
	}

	
	/////////////////////////////
	// - MARK: stringNumbers
	/////////////////////////////
	/////////////////////////////
	// - MARK: operators
	/////////////////////////////
	// assuretoi que operators n'est pas vide WHEN operators est une chaine de strin Then alors operators = +
	func testGivenOperatorsIsPlusString_WhenOperatorsIsInitialisate_ThenOperatorsIsPlusString() {
	
	
		// ETANT DONNÉ QUE le poste n'a pas de like
		// QUAND le poste est liké
		operations.operators = ["+"]
		// ALORS le poste a un like
		XCTAssert(operations.operators == ["+"])
	}
	/////////////////////////////
	// - MARK: isExpressionCorrect
	/////////////////////////////

	/////////////////////////////
	// - MARK: canAddOperator
	/////////////////////////////
	
	/////////////////////////////
	// - MARK: calculateTotal
	/////////////////////////////

	func testGivenVarTotalToStringIsEmptyString_WhenIsExpressionIsCorrect_ThenTotalToStringisEmpty() {
		// ETANT DONNÉ QUE
		// QUAND
			operations.stringNumbers = ["5", "2"]
			operations.operators = ["+","-"]
		// ALORS
			XCTAssert(operations.calculateTotal() == "3")
		
	}
	func testGivenTwoNumbersWithMinusOperand_WhenEqualButtonIspressed_ThenResultIsTheDifference() {
		// ETANT DONNÉ QUE
		// QUAND
//		operations.stringNumbers = ["5", "2"]
//		operations.operators = ["+","+"]
		let _ = operations.addNewNumber(5)
		let _ = operations.minusActionButton()
		let _ = operations.addNewNumber(2)
		
		// ALORS
		XCTAssert(operations.calculateTotal() == "3")
		
	}
	func testGivenTwoNumbersWithPlusOperand_WhenEqualButtonIspressed_ThenResultIsTheAddition() {
		// ETANT DONNÉ QUE
		// QUAND
		let _ = operations.addNewNumber(2)
		let _ = operations.plusActionButton()
		let _ = operations.addNewNumber(2)
		XCTAssert(operations.calculateTotal() == "4")
	}
	func testGivenTwoNumbersWithMultiplyOperand_WhenEqualButtonIspressed_ThenResultIsTheMultiplication() {
		// ETANT DONNÉ QUE
		// QUAND
		let _ = operations.addNewNumber(2)
		let _ = operations.multiplyActionButton()
		let _ = operations.addNewNumber(3)
		XCTAssert(operations.calculateTotal() == "6")
	}
	func testGivenTwoNumbersWithDivideOperand_WhenEqualButtonIspressed_ThenResulIsTheDivision() {
		// ETANT DONNÉ QUE
		// QUAND
		let _ = operations.addNewNumber(2)
		let _ = operations.divideActionButton()
		let _ = operations.addNewNumber(2)
		XCTAssert(operations.calculateTotal() == "0")
	}

	func testGiventotalToStringIsEmpty_WhenIsNoCorrect_ThenTotalToStringIsAlwaysEmpty() {
//		if operations.isExpressionCorrect []
//			XCTAssert(operations.calculateTotal() == "")
//		}
		
	}
	func testGivenStringNumbersisEmpty_WhenIsExpressionIsCorrect_ThenIsExpressionIsRefused() {
		operations.stringNumbers = [""]
		XCTAssert(operations.isExpressionCorrect == false)
	}
	func testGivenStringNumbersHasOneElement_WhenIsExpressionIsCorrect_ThenIsExpressionisRefused() {
		operations.stringNumbers = ["0"]
		XCTAssert(operations.isExpressionCorrect == true)
	}

	/////////////////////////////
	// - MARK: PlusButtonTest
	/////////////////////////////
	func testGivenplusActionButtonisClicked_WhenYouClickOnPlusActionButton_ThenOperandsIsPlus() {
		operations.stringNumbers = ["1"]
		XCTAssert(operations.canAddOperator == true)
		XCTAssert(operations.plusActionButton() == "+")
		
	}
	
	func testGivenMinusActionButtonIsClicked_WhenYouClickOnMinusActionButton_ThenOperandsIsMinus() {
		operations.stringNumbers = ["1"]
		XCTAssert(operations.canAddOperator == true)
		XCTAssert(operations.minusActionButton() == "-")
		
	}
	
	/////////////////////////////
	// - MARK: clear
	/////////////////////////////
	func testGivenResultIsDisplayed_WhenClearIsPressed_ThenResetData () {
		operations.stringNumbers = ["3", "2"]
		operations.operators = ["+", "-"]
		operations.clear()
		XCTAssert(operations.stringNumbers == [String()])
		XCTAssert(operations.operators == ["+"])
		
	}
	/////////////////////////////
	// - MARK: updateDisplay
	/////////////////////////////
	func testGivenStringNumberIsLaunched_WhenStringNumbersIsDetermine_ThenStringNumbersIsDisplayed() {
		// ETANT DONNÉ QUE
		// QUAND
		operations.stringNumbers = ["0"]
		//operations.operators = ["+"]
		// ALORS
		XCTAssert(operations.updateDisplay() == "0")
	}
	func testGivenOperatorsIsLaunched_WhenOperatorsIsDetermine_ThenOperatorsIsDisplayed() { // test updateDisplay
		// ETANT DONNÉ QUE
		// QUAND

		operations.operators = [""]
		// ALORS
		XCTAssert(operations.updateDisplay() == "")
	}
	func testGivenStringNumbersHasAValue_WhenNumbersArePressed_ThenStringNumbersAppendNewNumber() {
		operations.stringNumbers = ["1"]
		operations.addNewNumber(1)
		XCTAssert(operations.stringNumbers == ["11"])
		
	}
}

