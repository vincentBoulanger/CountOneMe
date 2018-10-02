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
	func testAlertProtocolDelegate() {
		XCTAssert(2*2 == 4)
		XCTAssert(true || false)
//		XCTAssert(true && false)
//		XCTAssert(365%7 == 0)
		XCTAssert([1, 2, 3, 4].count == [5, 6, 7, 8].count)
		
	}
	func testIsExpressionCorrect() {

//			if operations.stringNumbers.count == 1 {
//
//
//			} else {
//				XCTAssertEqual(operations.calculateTotal()
//
//				operations.alertDelegateProtocol?.displayAlert(title: "Zéro!", message: "Entrez une expression correcte !")
//			}

	}

	func testCanAddOperator() {
		
	}
	func testCalculateTotal() {
		
	}
	func testAddNumber() {
		//operations.plusActionButton() == "+"
		
	}
	func testUpdateDisplay() {
		//XCT
	}
	func testClear() {
//		if operations.stringNumbers != operations.stringNumbers.removeAll() {
//
//		}
	}
	func testPlusActionButton() {
		if operations.canAddOperator == true {
			XCTAssert(operations.plusActionButton() == "")
		} else {
			XCTAssert(operations.plusActionButton() == "")
		}
		
		
	}
	func testMinusActionButton() {
		if operations.canAddOperator == true {
			XCTAssert(operations.plusActionButton() == "-")
		} else {
			XCTAssert(operations.plusActionButton() == "")
		}
	}
	
//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
