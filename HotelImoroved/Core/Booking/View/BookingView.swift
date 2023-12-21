//
//  BookingView.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

struct BookingView<ViewModelType:BookingViewModelType>: View {
        
    @StateObject private var bookingViewModel: ViewModelType
    @FocusState private var emailFieldIsFocused: Bool
    @FocusState private var phoneFieldIsFocused: Bool

    init(viewModel: ViewModelType) {
        _bookingViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 8) {
                
                CustomNavBar(navigationTitle: "Бронирование", showBackButton: true) {
                    bookingViewModel.pop()
                }
                
                VStack(spacing: 8) {
                    
                    HotelBasicInfoView(hotelName: bookingViewModel.bookingInfo?.hotelName , hotelAdress: bookingViewModel.bookingInfo?.hotelAdress, hotelRating: bookingViewModel.bookingInfo?.horating, hotelRatingName: bookingViewModel.bookingInfo?.ratingName)
                        .padding(16)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    bookingDetailsView
                    
                    clientInfoView
                    
                    VStack(spacing: 8) {
                        ForEach($bookingViewModel.tourists) { tourist in
                            TouristInfoView(tourist: tourist, showError: bookingViewModel.showTouristInfoError)
                        }
                    }
                    
                    addTouristView
                    
                    bookingPaymentView
                    
                    ContinueButton(text: "Оплатить \((bookingViewModel.totalPrice ?? 0).formatAsPrice()) ₽") {
                        bookingViewModel.checkTouristInfo()
                    }
                }
            }
            .background(Color.backgroundGray)
        }
        .toolbar(.hidden, for: .navigationBar)
        .scrollIndicators(.hidden)
        .background(Color.white)
        .onAppear {
            bookingViewModel.getBookingData()
        }
    }
}

//MARK: - Subviews

extension BookingView {
    
    private var bookingDetailsView: some View {
        VStack(spacing: 16) {
            
            BookingDetailsView(category: "Вылет из", info: bookingViewModel.bookingInfo?.departure ?? "")
            BookingDetailsView(category: "Страна, город", info: bookingViewModel.bookingInfo?.arrivalCountry ?? "")
            BookingDetailsView(category: "Даты", info: "\(bookingViewModel.bookingInfo?.tourDateStart ?? "")- \(bookingViewModel.bookingInfo?.tourDateStop ?? "")")
            BookingDetailsView(category: "Кол-во ночей", info: ("\(bookingViewModel.bookingInfo?.numberOfNights ?? 0) ночей"))
            BookingDetailsView(category: "Отель", info: "Steigenberger Makadi")
            BookingDetailsView(category: "Номер", info: bookingViewModel.bookingInfo?.room ?? "")
            BookingDetailsView(category: "Питание", info: bookingViewModel.bookingInfo?.nutrition ?? "")
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    private var clientInfoView: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Информация о покупателе")
                .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
            
            VStack(spacing: 8) {
                
                
                FloatingLabelTextField(placeholder: "Номер телефона", text: $bookingViewModel.number, keyboardtype: .phonePad)
                    .background(bookingViewModel.isNumberValid ? Color.backgroundGray : Color.error)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .focused($phoneFieldIsFocused)
                    .onChange(of: bookingViewModel.number) {
                        if !bookingViewModel.number.isEmpty {
                            bookingViewModel.number = bookingViewModel.number.formatPhoneNumber()
                        }
                    }
                    .onChange(of: phoneFieldIsFocused) { oldValue, newValue in
                        if newValue == false {
                            bookingViewModel.validateNumber()
                        } else if newValue == true && bookingViewModel.number.isEmpty {
                            bookingViewModel.number = "+7"
                        }
                    }
                
                FloatingLabelTextField(placeholder: "Почта", text: $bookingViewModel.email, keyboardtype: .emailAddress)
                    .background(bookingViewModel.isEmailValid ? Color.backgroundGray : Color.error)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .focused($emailFieldIsFocused)
                    .onChange(of: emailFieldIsFocused) { oldValue, newValue in
                        if newValue == false {
                            bookingViewModel.validateEmail()
                        }
                    }
                                            
                Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                    .font(Font.custom("SF Pro Display", size: 14))
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    private var bookingPaymentView: some View {
        VStack(spacing: 16) {
            
            BookingPaymentView(payment: .tour, money: bookingViewModel.bookingInfo?.tourPrice ?? 0)
            BookingPaymentView(payment: .fuel, money: bookingViewModel.bookingInfo?.fuelCharge ?? 0)
            BookingPaymentView(payment: .service, money: bookingViewModel.bookingInfo?.serviceCharge ?? 0)
            BookingPaymentView(payment: .overall, money: bookingViewModel.totalPrice ?? 0)
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    private var addTouristView: some View {
        HStack {
            
            Text("Добавить Туриста")
                .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
            
            Spacer()
            
            Button {
                bookingViewModel.addNewTourist()
            } label: {
                Image("plus")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(10)
                    .background(Color.buttonBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
