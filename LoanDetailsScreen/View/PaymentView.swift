//
//  ContentView.swift
//  LoanDetailsScreen
//
//  Created by Andres on 7/08/24.
//

import SwiftUI

struct PaymentView: View {
    
    @StateObject private var paymentViewModel = PaymentViewModel()
    @State private var progress = 0.0

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                if let payment = paymentViewModel.ResponsePayment {
                    
                    ScrollView {
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // Due in Days
                            PaymentDetailCard(title: "Due in", value: "\(payment.paymentDetails.dueInDays) Days", icon: "calendar.badge.clock")
                                .accessibility(identifier: "dueInPaymentDetailCard")
                            
                            // Amount Due
                            PaymentDetailCard(title: "Amount due", value: "\(payment.paymentDetails.amountDue)", icon: "dollarsign.circle")
                                .accessibility(identifier: "amountDuePaymentDetailCard")
                            
                            // Next Payment Date
                            PaymentDetailCard(title: "Next payment", value: payment.paymentDetails.formattedNextPaymentDate, icon: "calendar")
                                .accessibility(identifier: "nextPaymentPaymentDetailCard")

                                    
                            // Payment Progress
                            VStack(alignment: .center) {
                                
                                ProgressView(value: progress, total: Double(payment.paymentDetails.paymentProgress.totalPayments))
                                    .progressViewStyle(                PaymentProgressViewStyle(color: .green, strokeWidth: 10.0))
                                    .padding(.bottom, 4)
                                    .frame(width: 100, height: 100)
                                    .onAppear {
                                        startProgressAnimation()
                                    }
                                
                                HStack {
                                    Text("\(payment.paymentDetails.paymentProgress.currentPaymentNumber) of \(payment.paymentDetails.paymentProgress.totalPayments) payments")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)                            
                            
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    // Navigation Link
                    NavigationLink(destination: LoanDetailsView(loanDetails: payment.loanDetails)) {
                        Text("Make a payment")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(12)
                            .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)

                            .accessibility(identifier: "makePaymentButton")

                    }
                    .padding()
                    
                } else {
                    Text("Loading...")
                        .onAppear {
                            paymentViewModel.load()
                        }
                        .accessibility(identifier: "loadingText")

                }
            }
            .padding()
            .navigationTitle("Payment Details")
            
        }
        .navigationViewStyle(StackNavigationViewStyle()) 

    }
    
    private func startProgressAnimation() {
        withAnimation(.linear(duration: 1.0)) {
            if let payment = paymentViewModel.ResponsePayment {
                progress = Double(payment.paymentDetails.paymentProgress.currentPaymentNumber)
            }
        }
    }
}




struct PaymentDetailCard: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        HStack {            
            Image(systemName: icon)
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.purple)
                .background(Color.purple.opacity(0.2))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                valueText(value)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .padding()
        }
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    PaymentView()
}
