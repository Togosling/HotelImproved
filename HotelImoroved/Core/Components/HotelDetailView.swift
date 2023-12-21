//
//  HotelDetailView.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

struct HotelDetailView: View {
    
    let details: [Detail]
    let detail: Detail
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            HStack(spacing: 12) {
                
                Image(detail.image)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(detail.type)
                        .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                    
                    Text(detail.additionalInfo)
                        .font(Font.custom("SF Pro Display", size: 14).weight(.medium))
                }
                
                Spacer()
                
                Image("right")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            
            if detail != details.last {
                Divider()
                    .padding(.leading, 38)
            }
        }
    }
}
