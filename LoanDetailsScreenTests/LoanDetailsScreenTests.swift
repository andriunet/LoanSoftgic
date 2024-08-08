//
//  LoanDetailsScreenTests.swift
//  LoanDetailsScreenTests
//
//  Created by Andres on 6/08/24.
//

import XCTest
@testable import LoanDetailsScreen

final class LoanDetailsScreenTests: XCTestCase {

    func testJSONParsing() throws {

        if let path = Bundle.main.path(forResource: "payment", ofType: "json") {
            
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let response = try JSONDecoder().decode(Payment.self, from: jsonData)

                XCTAssertEqual(response.email, "example@example.com")
                
                XCTAssertEqual(response.paymentDetails.dueInDays, 2)
                XCTAssertEqual(response.paymentDetails.amountDue, 325.93)
                XCTAssertEqual(response.paymentDetails.nextPaymentDate, "2024-02-24")
                XCTAssertEqual(response.paymentDetails.paymentProgress.currentPaymentNumber, 8)
                XCTAssertEqual(response.paymentDetails.paymentProgress.totalPayments, 10)

                XCTAssertEqual(response.loanDetails.loanID, "JMI-923429")
                XCTAssertEqual(response.loanDetails.remainingBalance, 652)
                XCTAssertEqual(response.loanDetails.amountBorrowed, 3250)
                XCTAssertEqual(response.loanDetails.interestPaidToDate, 319.77)
                XCTAssertEqual(response.loanDetails.interestRate, 9.9)
                XCTAssertEqual(response.loanDetails.maxCreditAmount, 10000)
                XCTAssertEqual(response.loanDetails.repaymentDay, 12)
                XCTAssertEqual(response.loanDetails.lastFourPaymentCard, "7284")
                XCTAssertEqual(response.loanDetails.numberOfDocuments, 4)
                
            } catch {
                XCTFail("Failed to decode JSON: \(error.localizedDescription)")
            }
        }
        
    }
    
    
    func testLoanDetailsDataModel() {
        
        let loanDetails = LoanDetails(
            loanID: "JMI-923429",
            remainingBalance: 652,
            amountBorrowed: 3250,
            interestPaidToDate: 319.77,
            interestRate: 9.9,
            maxCreditAmount: 10000,
            repaymentDay: 12,
            lastFourPaymentCard: "7284",
            numberOfDocuments: 4
        )
        
        XCTAssertEqual(loanDetails.loanID, "JMI-923429")
        XCTAssertGreaterThan(loanDetails.remainingBalance, 0)
        XCTAssertGreaterThan(loanDetails.amountBorrowed, 0)
        XCTAssertGreaterThanOrEqual(loanDetails.interestPaidToDate, 0)
        XCTAssertGreaterThan(loanDetails.interestRate, 0)
        XCTAssertGreaterThan(loanDetails.maxCreditAmount, 0)
        XCTAssert(loanDetails.repaymentDay >= 1 && loanDetails.repaymentDay <= 31)
        XCTAssert(loanDetails.lastFourPaymentCard.count == 4)
        XCTAssertGreaterThan(loanDetails.numberOfDocuments, 0)
        
    }
    
}
