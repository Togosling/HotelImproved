//
//  Int+Price.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import Foundation

extension Int {
    func formatAsPrice() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "

        if let formattedPrice = numberFormatter.string(from: NSNumber(value: self)) {
            return formattedPrice
        } else {
            return "\(self)"
        }
    }
}
