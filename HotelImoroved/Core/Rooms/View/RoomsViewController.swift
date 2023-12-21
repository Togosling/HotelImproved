//
//  RoomsViewController.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit
import SwiftUI

class RoomsViewController: UIViewController {
    
    private let roomsView: UIViewController
    
    init(roomsViewModel: RoomsViewModel) {
        self.roomsView = UIHostingController(rootView: RoomsView(viewModel: roomsViewModel))
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(roomsView)
        view.addSubview(roomsView.view)
        setupConstraints()
    }
    
    //MARK: - Private
    
    private func setupConstraints() {
        roomsView.view.translatesAutoresizingMaskIntoConstraints = false
        roomsView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        roomsView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        roomsView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        roomsView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
