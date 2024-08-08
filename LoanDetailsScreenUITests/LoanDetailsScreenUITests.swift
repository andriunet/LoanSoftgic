//
//  LoanDetailsScreenUITests.swift
//  LoanDetailsScreenUITests
//
//  Created by Andres on 6/08/24.
//

import XCTest

final class LoanUITests: XCTestCase {
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }
    
    func testNavigationToLoanDetails() throws {
        let app = XCUIApplication()
        
        let makePaymentButton = app.buttons["Make a payment"]
        XCTAssertTrue(makePaymentButton.exists, "Make a payment button should be visible")
        makePaymentButton.tap()
        
        let loanDetailsText = app.staticTexts["Loan Details"]
        XCTAssertTrue(loanDetailsText.waitForExistence(timeout: 2), "Loan details view should appear after navigation")
    }
    
    
    
    func testLoanDetailsViewDisplaysCorrectData() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["makePaymentButton"].tap()
        
        XCTAssertTrue(app.staticTexts["leftText"].exists)
        XCTAssertTrue(app.staticTexts["remainingBalanceText"].exists)
        XCTAssertTrue(app.staticTexts["amountBorrowedText"].exists)
        XCTAssertTrue(app.staticTexts["amountBorrowedValueText"].exists)
        
        XCTAssertTrue(app.progressIndicators["progressView"].exists)
        
        let upcomingPaymentsButton = app.buttons["upcomingPaymentsButton"]
        XCTAssertTrue(upcomingPaymentsButton.exists)
        upcomingPaymentsButton.tap()
        
    }
    
}
