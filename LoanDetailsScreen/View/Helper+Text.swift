//
//  Helper+Text.swift
//  LoanDetailsScreen
//
//  Created by Andres on 7/08/24.
//

import Foundation
import SwiftUI

func valueText(_ value: String) -> Text {
    let parts = value.split(separator: ".")
    guard parts.count == 2 else {
        return Text(value)
    }
    
    let integerPart = parts[0]
    let decimalPart = parts[1]
    
    return Text("\(integerPart).")
        .font(.title2)
        .fontWeight(.bold)
    + Text("\(decimalPart)")
        .font(.subheadline)
        .foregroundColor(.gray)
}
