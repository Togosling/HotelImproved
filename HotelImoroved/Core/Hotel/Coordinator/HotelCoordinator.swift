//
//  HotelCoordinator.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit

class HotelCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let viewModel = HotelViewModel.init()
        viewModel.coordinator = self
        let hotelController = HotelViewController(hotelViewModel: viewModel)
        navigationController.pushViewController(hotelController, animated: true)
    }
    
    func pop() {
        
    }
    
    func pushToRooms(hotelName: String) {
        let roomsCoordinator = RoomsCoordinator(navController: navigationController, hotelName: hotelName)
        roomsCoordinator.start()
    }
}
