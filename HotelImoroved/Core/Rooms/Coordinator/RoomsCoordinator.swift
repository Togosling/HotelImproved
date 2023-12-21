//
//  RoomsCoordinator.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit

class RoomsCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var hotelName: String
    
    init(navController: UINavigationController, hotelName: String) {
        self.navigationController = navController
        self.hotelName = hotelName
    }
    
    func start() {
        let viewModel = RoomsViewModel.init(hotelName: hotelName)
        viewModel.coordinator = self
        let roomsViewController = RoomsViewController(roomsViewModel: viewModel)
        navigationController.pushViewController(roomsViewController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func pushToBooking() {
        let bookingCoordinator = BookingCoordinator(navController: navigationController)
        bookingCoordinator.start()
    }
}
