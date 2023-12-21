//
//  BookingViewModel.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI
import UIKit

protocol BookingViewModelType: ObservableObject {
    
    var bookingInfo: BookingInfo? { get }
    var totalPrice: Int? { get }
    var number: String { get set }
    var email: String { get set }
    var tourists: [Tourist] { get set }
    var showTouristInfoError: Bool { get }
    var isEmailValid: Bool { get }
    var isNumberValid: Bool { get }
    
    func getBookingData()
    
    func addNewTourist()
    
    func pop()
    
    func validateEmail()
    
    func validateNumber()
    
    func checkTouristInfo()
}

class BookingViewModel: BookingViewModelType {
    
    @Published var bookingInfo: BookingInfo?
    @Published var totalPrice: Int?
    @Published var number: String = ""
    @Published var email: String = ""
    @Published var tourists: [Tourist] = [Tourist(id: 1)]
    @Published var isEmailValid: Bool = true
    @Published var isNumberValid: Bool = true
    @Published var showTouristInfoError: Bool = false
    
    var coordinator = BookingCoordinator(navController: UINavigationController.init())
    
    func getBookingData() {
        NetworkService.shared.getBookingData { [weak self] bookingInfo, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let bookingInfo = bookingInfo {
                DispatchQueue.main.async {
                    self?.bookingInfo = bookingInfo
                    self?.totalPrice = (bookingInfo.fuelCharge ?? 0) + (bookingInfo.serviceCharge ?? 0) + (bookingInfo.tourPrice ?? 0)
                }
            }
        }
    }
    
    func addNewTourist() {
        tourists.append(Tourist(id: (tourists.last?.id ?? 0) + 1))
    }
    
    func pop() {
        coordinator.pop()
    }
    
    func validateEmail() {
        isEmailValid = email.isValidEmail()
    }
    
    func validateNumber() {
        isNumberValid = number.count == 18
    }
    
    func checkTouristInfo() {
        validateEmail()
        validateNumber()
        
        for tourist in tourists {
            if !tourist.name.isEmpty && !tourist.surname.isEmpty && !tourist.dateOfBirth.isEmpty && !tourist.citizenship.isEmpty && !tourist.passportExpireDate.isEmpty && !tourist.passportNumber.isEmpty {
                showTouristInfoError = false
            } else {
                showTouristInfoError = true
            }
        }
        
        if !showTouristInfoError && isEmailValid && isNumberValid {
            coordinator.pushToPayment()
        }
    }
}
