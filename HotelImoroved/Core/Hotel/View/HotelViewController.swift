//
//  HotelViewController.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit
import SwiftUI

class HotelViewController: UIViewController {
    
    private let hotelView: UIViewController
    
    init(hotelViewModel: HotelViewModel) {
        self.hotelView = UIHostingController(rootView: HotelView(viewModel: hotelViewModel))
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(hotelView)
        view.addSubview(hotelView.view)
        setupConstraints()
    }
    
    //MARK: - Private
    
    private func setupConstraints() {
        hotelView.view.translatesAutoresizingMaskIntoConstraints = false
        hotelView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hotelView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hotelView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hotelView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
