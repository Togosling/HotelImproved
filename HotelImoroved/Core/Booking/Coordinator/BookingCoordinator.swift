//
//  BookingCoordinator.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit

class BookingCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let viewModel = BookingViewModel.init()
        viewModel.coordinator = self
        let bookingViewController = BookingViewController(bookingViewModel: viewModel)
        navigationController.pushViewController(bookingViewController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func pushToPayment() {
        let paymentCoordinator = PaymentCoordinator(navController: navigationController)
        paymentCoordinator.start()
    }
}
