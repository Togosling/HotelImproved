//
//  RoomsView.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI
import Combine

struct RoomsView<ViewModelType:RoomsViewModelType>: View {
        
    @StateObject private var roomsViewModel: ViewModelType
        
    init(viewModel: ViewModelType) {
        _roomsViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 8) {
                
                CustomNavBar(navigationTitle: roomsViewModel.hotelName, showBackButton: true) {
                    roomsViewModel.pop()
                }
                
                VStack(spacing: 8) {
                    
                    oneRoomView
                    
                }
            }
            .background(Color.backgroundGray)
        }
        .toolbar(.hidden, for: .navigationBar)
        .scrollIndicators(.hidden)
        .background(Color.white)
        .onAppear {
            roomsViewModel.getRoomsData()
        }
    }
}

//MARK: - Subviews

extension RoomsView {
    
    private var additionalInfoView: some View {
        
        HStack(spacing: 2) {
            
            Text("Подробнее о номере")
                .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
            
            Image("right")
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
        }
        .padding(.vertical, 5)
        .padding(.leading, 10)
        .foregroundStyle(Color.buttonBlue)
        .background(Color.blueBackground)
        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
    }
    
    private var oneRoomView: some View {
        
        ForEach(roomsViewModel.rooms ?? []) { room in
            
            VStack(alignment: .leading, spacing: 16) {
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    PaginationImageScrollView(imageUrlStrings: room.imageUrls ?? [])
                    
                    Text(room.name ?? "")
                        .font(Font.custom("SF Pro Display", size: 22).weight(.medium))

                    DetailCloudView(tags: room.peculiarities ?? [])
                    
                    additionalInfoView
                }
            
                HStack(alignment: .firstTextBaseline ,spacing: 8) {
                    
                    Text("\(room.price?.formatAsPrice() ?? "") ₽")
                        .font(Font.custom("SF Pro Display", size: 30).weight(.semibold))
                    
                    Text(room.pricePer ?? "")
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                }
                
                Button(action: {
                    roomsViewModel.pushToBookingView()
                }, label: {
                    Text("Выбрать номер")
                        .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .foregroundStyle(Color.white)
                        .kerning(0.1)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                })
                .background(Color.buttonBlue)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            .padding(16)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}
