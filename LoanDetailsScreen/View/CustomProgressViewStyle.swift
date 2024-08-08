//
//  CustomProgressViewStyle.swift
//  LoanDetailsScreen
//
//  Created by Andres on 7/08/24.
//

import SwiftUI

struct CustomLinearProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            LinearProgressView(value: configuration.fractionCompleted ?? 0)
                .frame(maxWidth: .infinity, minHeight: 15)
                .background(Color.gray.opacity(0.3))
                .foregroundColor(.green)
                .cornerRadius(5)
        }
    }
    
    private struct LinearProgressView: View {
        let value: Double
        
        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Color.gray.opacity(0.3)
                    Color.green
                        .frame(width: CGFloat(value) * geometry.size.width, height: geometry.size.height)
                }
                .cornerRadius(5)
            }
        }
    }
}

struct PaymentProgressViewStyle: ProgressViewStyle {
    var color: Color = .blue
    var strokeWidth: CGFloat = 8.0
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: strokeWidth)
            Circle()
                .trim(from: 0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(color, lineWidth: strokeWidth)
                .rotationEffect(.degrees(-90))
            VStack {
                Text(String(format: "%.0f%%", (configuration.fractionCompleted ?? 0) * 100))
                    .font(.headline)
                    .foregroundColor(color)
            }
        }
    }
}
