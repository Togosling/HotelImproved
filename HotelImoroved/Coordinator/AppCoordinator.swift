//
//  AppCoordinator.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit
import SwiftUI

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navCon : UINavigationController) {
        self.navigationController = navCon
    }
    
    func start() {
        let hotelCoordinator = HotelCoordinator(navController: navigationController)
        hotelCoordinator.start()        
    }
    
    func pop() {
        
    }
}
