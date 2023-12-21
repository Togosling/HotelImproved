//
//  BookingDetailsView.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

struct BookingDetailsView: View {
    
    let category: String
    let info: String
    
    var body: some View {
        
        HStack {
            
            Text(category)
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundStyle(Color.textGray)
            
            Spacer()
            
            Text(info)
                .font(Font.custom("SF Pro Display", size: 16))
                .frame(width: UIScreen.main.bounds.width / 1.9, alignment: .leading)
            
        }
    }
}
