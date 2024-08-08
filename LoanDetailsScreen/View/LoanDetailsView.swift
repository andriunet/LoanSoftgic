//
//  LoanDetailsView.swift
//  LoanDetailsScreen
//
//  Created by Andres on 7/08/24.
//

import SwiftUI
import Charts

struct LoanDetailsView: View {

    let loanDetails: LoanDetails   
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Spacer()
                                            
                VStack(spacing: 15) {
                    // Money stats
                    HStack(spacing: 10) {
                        Text("Left")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .accessibility(identifier: "leftText")
                        Text("$\(loanDetails.remainingBalance.formatted())")
                            .font(.headline)
                            .fontWeight(.bold)               
                            .accessibility(identifier: "remainingBalanceText")

                        Spacer()
                        Text("Amount Borrowed")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .accessibility(identifier: "amountBorrowedText")
                        Text("$\(loanDetails.amountBorrowed.formatted())")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .accessibility(identifier: "amountBorrowedValueText")
  
                    }
                    
                    ProgressView(value:  Double(loanDetails.amountBorrowed), total: Double(loanDetails.remainingBalance + loanDetails.amountBorrowed))
                        .progressViewStyle(CustomLinearProgressViewStyle())
                        .padding(.bottom, 4)
                        .accessibility(identifier: "progressView")
                }
                .padding()
                           
                
                // Grid with loan details
                LazyVGrid(columns: gridItems, spacing: 16) {
                    
                    DetailCard(title: "Interest", value: "\(loanDetails.interestPaidToDate)%")
                        .accessibility(identifier: "interestDetailCard")
                    DetailCard(title: "Interest Rate", value: "\(loanDetails.interestRate)%")
                        .accessibility(identifier: "interestRateDetailCard")
                    DetailCard(title: "Loan ID", value: loanDetails.loanID)
                        .accessibility(identifier: "loanIDDetailCard")
                       
                    // Navigation Link
                    NavigationLink(destination: MoreOptionsView(loanDetails: loanDetails)) {
                        Text("Upcoming payments")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.purple)
                            .cornerRadius(12)
                            .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
                            .accessibility(identifier: "upcomingPaymentsButton")
                    }
                }
                .padding()
                
            }
            .padding()
            .navigationTitle("Loan Details")
            .edgesIgnoringSafeArea(.bottom)
        }
        .background(Color(UIColor.systemGray6))
    }
    
}


struct DetailCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack() {
            HStack {
                VStack(alignment: .center, spacing: 4) {
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .accessibility(identifier: "\(title)Title")
                    Spacer()
                    Spacer()
                    Text(value)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .accessibility(identifier: "\(title)Value")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
            .background(Color(UIColor.white))
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 4)
        }
    }
}



#Preview {
    LoanDetailsView(loanDetails: LoanDetails(loanID: "JMI-923429", remainingBalance: 652, amountBorrowed: 3250, interestPaidToDate: 319.77, interestRate: 9.9, maxCreditAmount: 10000, repaymentDay: 12, lastFourPaymentCard: "7284", numberOfDocuments: 4))
}
