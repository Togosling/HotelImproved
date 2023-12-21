//
//  PaymentViewController.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import UIKit
import SwiftUI

class PaymentViewController: UIViewController {
    
    private let paymentView: UIViewController
    
    init(paymentViewModel: PaymentViewModel) {
        self.paymentView = UIHostingController(rootView: PaymentView(viewModel: paymentViewModel))
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(paymentView)
        view.addSubview(paymentView.view)
        setupConstraints()
    }
    
    //MARK: - Private
    
    private func setupConstraints() {
        paymentView.view.translatesAutoresizingMaskIntoConstraints = false
        paymentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        paymentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        paymentView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        paymentView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
