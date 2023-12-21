//
//  PaginationImageScrollView.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

struct PaginationImageScrollView: View {
    
    let imageUrlStrings: [String]
    
    @State private var currentPage = 0
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 0) {
                
                ForEach(imageUrlStrings.indices, id: \.self) { index in
                    
                    AsyncImage(url: URL(string: imageUrlStrings[index])) { image in
                        image
                            .resizable()
                            .containerRelativeFrame(.horizontal)
                    } placeholder: {
                        EmptyView()
                    }
                }
            }
            .background(GeometryReader {
                Color.clear.preference(key: ViewOffsetKey.self, value: -$0.frame(in: .named("scroll")).origin.x)
            })
            .onPreferenceChange(ViewOffsetKey.self) {
                currentPage = Int($0) / Int(UIScreen.main.bounds.width - 32)
            }
        }
        .coordinateSpace(name: "scroll")
        .scrollTargetBehavior(.paging)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .frame(height: 257)
        .overlay {
            pageControl
        }
    }
}

extension PaginationImageScrollView {
    
    private var pageControl: some View {
        
        VStack {
            
            Spacer()
            
            HStack(spacing: 5) {
                
                ForEach(imageUrlStrings.indices, id: \.self) { index in
                    
                    Circle()
                        .frame(width: 7, height: 7)
                        .foregroundStyle(index == currentPage ? Color.black : Color.black.opacity(0.2))
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.bottom, 8)
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    
    typealias Value = CGFloat
    
    static var defaultValue = CGFloat.zero
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
