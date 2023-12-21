//
//  ToursitInfoView.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

struct TouristInfoView: View {
    
    @Binding var tourist: Tourist
    var showError: Bool
    @State var isHidden: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                
                Text(tourist.id == 1 ? "Первый турист" : "Второй турист")
                    .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                
                Spacer()
                
                Button {
                    isHidden.toggle()
                } label: {
                    Image("right")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.buttonBlue)
                        .rotationEffect(Angle(degrees: isHidden ? 90 : -90))
                        .frame(width: 24, height: 24)
                        .padding(10)
                        .background(Color.blueBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
            }
            
            if !isHidden {
                VStack(spacing: 8) {
                    
                    FloatingLabelTextField(placeholder: "Имя", text: $tourist.name)
                        .background(showError && tourist.name.isEmpty ? Color.error : Color.backgroundGray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    FloatingLabelTextField(placeholder: "Фамилия", text: $tourist.surname)
                        .background(showError && tourist.surname.isEmpty ? Color.error : Color.backgroundGray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    FloatingLabelTextField(placeholder: "Дата рождения", text: $tourist.dateOfBirth)
                        .background(showError && tourist.dateOfBirth.isEmpty ? Color.error : Color.backgroundGray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    FloatingLabelTextField(placeholder: "Гражданство", text: $tourist.citizenship)
                        .background(showError && tourist.citizenship.isEmpty ? Color.error : Color.backgroundGray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    FloatingLabelTextField(placeholder: "Номер загранпаспорта", text: $tourist.passportNumber)
                        .background(showError && tourist.passportNumber.isEmpty ? Color.error : Color.backgroundGray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    FloatingLabelTextField(placeholder: "Срок действия загранпаспорта", text: $tourist.passportExpireDate)
                        .background(showError && tourist.passportExpireDate.isEmpty ? Color.error : Color.backgroundGray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
