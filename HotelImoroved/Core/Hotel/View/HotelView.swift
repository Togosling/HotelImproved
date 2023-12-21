//
//  HotelView.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

struct HotelView<ViewModelType:HotelViewModelType>: View {
        
    @StateObject private var hotelViewModel: ViewModelType
    
    init(viewModel: ViewModelType) {
        _hotelViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 0) {
                
                CustomNavBar(navigationTitle: "Отель", showBackButton: false)

                VStack(spacing: 8) {
                    
                    hotelTopView
                    
                    hotelDetailsView
                    
                    ContinueButton(text: "К выбору номера") {
                        hotelViewModel.pushRoomsView()
                    }
                }
                .background(Color.backgroundGray)
            }
        }
        .background(Color.white)
        .scrollIndicators(.hidden)
        .onAppear {
            hotelViewModel.getHotelData()
        }
    }
}

//MARK: - Subviews

extension HotelView {
    
    private var hotelTopView: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            PaginationImageScrollView(imageUrlStrings: hotelViewModel.hotel?.imageUrls ?? [])
            
            HotelBasicInfoView(hotel: hotelViewModel.hotel)
            
            HStack(alignment: .firstTextBaseline ,spacing: 8) {
                Text("от \(hotelViewModel.hotel?.minimalPrice?.formatAsPrice() ?? "") ₽")
                    .font(Font.custom("SF Pro Display", size: 30).weight(.semibold))
                
                Text(hotelViewModel.hotel?.priceForIt ?? "")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            }
        }
        .padding(.bottom, 16)
        .padding(.horizontal, 16)
        .background(Color.white)
        .clipShape(.rect(bottomLeadingRadius: 12, bottomTrailingRadius: 12))
    }
    
    private var hotelDetailsView: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Об отеле")
                .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
            
            DetailCloudView(tags: hotelViewModel.hotel?.aboutTheHotel?.peculiarities ?? [])
            
            Text(hotelViewModel.hotel?.aboutTheHotel?.description ?? "")
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(.black.opacity(0.9))
            
            VStack(spacing: 10) {
                ForEach(hotelViewModel.details) { detail in
                    HotelDetailView(details: hotelViewModel.details, detail: detail)
                }
            }
            .padding(15)
            .background(Color.backgroundGray)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
