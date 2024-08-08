//
//  MoreOptionsView.swift
//  LoanDetailsScreen
//
//  Created by Andres on 7/08/24.
//

import SwiftUI

struct MoreOptionsView: View {
    let loanDetails: LoanDetails
        
    var body: some View {
        ScrollView {
            VStack() {
                
                MoreOptionsCard(title: "Increase Paydown Credit", value: "Up to \(loanDetails.maxCreditAmount)", icon: "creditcard.fill")
                    .accessibility(identifier: "increaseMoreOptionsCard")
                
                MoreOptionsCard(title: "Change repayment date", value: "Currently on the \(loanDetails.repaymentDay)", icon: "calendar")
                    .accessibility(identifier: "changeRepaymentMoreOptionsCard")
                
                MoreOptionsCard(title: "Update payment details", value: "Account ending \(loanDetails.lastFourPaymentCard)", icon: "creditcard")
                    .accessibility(identifier: "updatePaymentMoreOptionsCard")
                
                MoreOptionsCard(title: "View saved documents", value: "\(loanDetails.numberOfDocuments) documents", icon: "tag")
                    .accessibility(identifier: "viewSavedMoreOptionsCard")
                          
            }
            .navigationTitle("More options")
        }
        .padding(10)
    }
}

struct MoreOptionsCard: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(.black)
                Text(value)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
            }
            .padding()
            
            Spacer()
            
            Image(systemName: icon)
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.purple)
                .background(Color.purple.opacity(0.2))
                .clipShape(Circle())
                .padding()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 4)
        .padding()
    }
}


#Preview {
    MoreOptionsView(loanDetails: LoanDetails(loanID: "JMI-923429", remainingBalance: 652, amountBorrowed: 3250, interestPaidToDate: 319.77, interestRate: 9.9, maxCreditAmount: 10000, repaymentDay: 12, lastFourPaymentCard: "7284", numberOfDocuments: 4))
}
