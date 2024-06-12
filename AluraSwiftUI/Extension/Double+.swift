//
//  Double+.swift
//  AluraSwiftUI
//
//  Created by Mateus Amorim on 12/06/24.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
