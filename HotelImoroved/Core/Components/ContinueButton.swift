//
//  ContinueButton.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

struct ContinueButton: View {
    
    let text: String
    let pressed: (() -> ())
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Divider()
            
            Button(action: {
                pressed()
            }, label: {
                Text(text)
                    .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                    .foregroundStyle(Color.white)
                    .kerning(0.1)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
            })
            .background(Color.buttonBlue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 16)
        }
        .background(Color.white)
    }
}
