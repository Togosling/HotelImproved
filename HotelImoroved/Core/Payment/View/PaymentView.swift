//
//  PaymentView.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

struct PaymentView<ViewModelType: PaymentViewModelType>: View {
    
    @StateObject private var paymentViewModel: ViewModelType
    
    init(viewModel: ViewModelType) {
        _paymentViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
    
        CustomNavBar(navigationTitle: "Заказ оплачен", showBackButton: true) {
            paymentViewModel.pop()
        }
        
        Spacer()
        
        Image("party")
            .resizable()
            .frame(width: 44, height: 44)
            .background(
                Circle()
                    .frame(width: 94, height: 94)
                    .foregroundStyle(Color.backgroundGray)
            )
        
        Spacer()
            .frame(height: 32)
        
        Text("Ваш заказ принят в работу")
            .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
        
        Spacer()
            .frame(height: 20)
        
        Text("Подтверждение заказа №\(paymentViewModel.paymentNumber) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
            .font(Font.custom("SF Pro Display", size: 16))
            .multilineTextAlignment(.center)
            .foregroundColor(Color.textGray)
            .padding(.horizontal, 23)
        
        Spacer()
        
        ContinueButton(text: "Супер!") {
            paymentViewModel.popToHotelView()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}
