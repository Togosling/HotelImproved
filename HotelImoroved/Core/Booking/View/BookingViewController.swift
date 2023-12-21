//
//  BookingViewController.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit
import SwiftUI

class BookingViewController: UIViewController {
    
    private let bookingView: UIViewController
    
    init(bookingViewModel: BookingViewModel) {
        self.bookingView = UIHostingController(rootView: BookingView(viewModel: bookingViewModel))
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(bookingView)
        view.addSubview(bookingView.view)
        setupConstraints()
    }
    
    //MARK: - Private
    
    private func setupConstraints() {
        bookingView.view.translatesAutoresizingMaskIntoConstraints = false
        bookingView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bookingView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bookingView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bookingView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
