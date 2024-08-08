//
//  PaymentViewModel.swift
//  LoanDetailsScreen
//
//  Created by Andres on 7/08/24.
//

import Foundation
import Combine

class PaymentViewModel: ObservableObject {
    @Published var ResponsePayment: Payment?

    init() {
        load()
    }

    func load() {
        
        guard let url = Bundle.main.url(forResource: "payment", withExtension: "json") else {
            print("Failed to locate data.json in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.ResponsePayment = try decoder.decode(Payment.self, from: data)
        } catch {
            print("Failed to load or decode data: \(error.localizedDescription)")
        }
        
    }
    
    
}
