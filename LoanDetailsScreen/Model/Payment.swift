//
//  Payment.swift
//  LoanDetailsScreen
//
//  Created by Andres on 7/08/24.
//

import Foundation

struct Payment: Codable {
    let email: String
    let paymentDetails: PaymentDetails
    let loanDetails: LoanDetails
}

struct PaymentProgress: Codable {
    let currentPaymentNumber: Int
    let totalPayments: Int
}

struct PaymentDetails: Codable {
    let dueInDays: Int
    let amountDue: Double
    let nextPaymentDate: String
    let paymentProgress: PaymentProgress
    
    var formattedNextPaymentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: nextPaymentDate) {
            dateFormatter.dateFormat = "E, MMM d"
            return dateFormatter.string(from: date)
        }
        return nextPaymentDate
    }

}

struct LoanDetails: Codable {
    let loanID: String
    let remainingBalance: Double
    let amountBorrowed: Double
    let interestPaidToDate: Double
    let interestRate: Double
    let maxCreditAmount: Int
    let repaymentDay: Int
    let lastFourPaymentCard: String
    let numberOfDocuments: Int
}


