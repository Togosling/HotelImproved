//
//  CustomNavigationBar.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

struct CustomNavBar: View {
    
    let navigationTitle: String
    let showBackButton: Bool
    let pressed: (() -> ())?
    
    init(navigationTitle: String, showBackButton: Bool, pressed: (() -> Void)? = nil) {
        self.navigationTitle = navigationTitle
        self.showBackButton = showBackButton
        self.pressed = pressed
    }
    
    var body: some View {
        
        ZStack {
            
            HStack {
                
                if showBackButton {
                    Button(action: {
                        pressed?()
                    }, label: {
                        Image("left")
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
                }
                
                Spacer()
                
            }
            
            Text(navigationTitle)
                .font(Font.custom("SF Pro Display", size: 18).weight(.medium))
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        .background(Color.white)
    }
}
