//
//  PaymentCoordinator.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit

class PaymentCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let viewModel = PaymentViewModel.init()
        viewModel.coordinator = self
        let paymentViewController = PaymentViewController(paymentViewModel: viewModel)
        navigationController.pushViewController(paymentViewController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}
