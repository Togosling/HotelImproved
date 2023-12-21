//
//  RoomsViewModel.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

protocol RoomsViewModelType: ObservableObject {
    
    var rooms: [Room]? { get }
    var hotelName: String { get }
    func getRoomsData()
    func pop()
    func pushToBookingView()
}

class RoomsViewModel: RoomsViewModelType {
    
    @Published var rooms: [Room]?
    
    var hotelName: String
        
    var coordinator = RoomsCoordinator(navController: UINavigationController.init(), hotelName: String.init())
    
    init(hotelName: String) {
        self.hotelName = hotelName
    }
    
    func getRoomsData() {
        NetworkService.shared.getRoomsData { [weak self] roomsModel, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let roomsModel = roomsModel{
                DispatchQueue.main.async {
                    self?.rooms = roomsModel.rooms
                }
            }
        }
    }
    
    func pop() {
        coordinator.pop()
    }
    
    func pushToBookingView() {
        coordinator.pushToBooking()
    }
}
