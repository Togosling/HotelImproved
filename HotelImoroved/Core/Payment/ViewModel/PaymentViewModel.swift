//
//  PaymentViewModel.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit

protocol PaymentViewModelType: ObservableObject {
    
    var paymentNumber: Int { get }
    
    func pop()
    
    func popToHotelView()
}

class PaymentViewModel: PaymentViewModelType {
    
    var coordinator = PaymentCoordinator(navController: UINavigationController.init())
    
    var paymentNumber = Int.random(in: 1..<100)
    
    func pop() {
        coordinator.pop()
    }
    
    func popToHotelView() {
        coordinator.popToRoot()
    }
}
