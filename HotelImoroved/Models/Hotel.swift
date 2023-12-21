//
//  Hotel.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import Foundation

struct Hotel: Codable {
    let id: Int?
    let name, adress: String?
    let minimalPrice: Int?
    let priceForIt: String?
    let rating: Int?
    let ratingName: String?
    let imageUrls: [String]?
    let aboutTheHotel: AboutTheHotel?

    enum CodingKeys: String, CodingKey {
        case id, name, adress, rating
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

struct AboutTheHotel: Codable {
    let description: String?
    let peculiarities: [String]?
}
