//
//  Room.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import Foundation

struct RoomsModel: Codable {
    let rooms: [Room]
}

struct Room: Codable, Identifiable {
    let id: Int?
    let name: String?
    let price: Int?
    let pricePer: String?
    let peculiarities: [String]?
    let imageUrls: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, price, peculiarities
        case pricePer = "price_per"
        case imageUrls = "image_urls"
    }
}
