//
//  BookingPaymentView.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

enum PaymentType {
    case tour
    case fuel
    case service
    case overall
    
    var title: String {
        switch self {
        case .tour:
            "Тур"
        case .fuel:
            "Топливный сбор"
        case .service:
            "Сервисный сбор"
        case .overall:
            "К оплате"
        }
    }
}

struct BookingPaymentView: View {
    
    let payment: PaymentType
    let money: Int
    
    var body: some View {
        
        HStack {
            
            Text(payment.title)
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundStyle(Color.textGray)
            
            Spacer()
            
            Text("\(money.formatAsPrice()) ₽")
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundStyle(payment == .overall ? Color.buttonBlue : Color.black)
        }
    }
}
