//
//  NetworkService.swift
//  HotelImoroved
//
//  Created by Тагай Абдылдаев on 2023/12/21.
//

import SwiftUI

enum DataError: Error {
    case invalidUrl
    case invalidData
    case invalidResponse
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private init () {}
    
    //MARK: - Public
    
    func getHotelData(completion: @escaping (Hotel?, Error?) -> ()) {
        fetchGenericJsonData(urlString: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473", completion: completion)
    }
    
    func getRoomsData(completion: @escaping (RoomsModel?, Error?) -> ()) {
        fetchGenericJsonData(urlString: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195", completion: completion)
    }
    
    func getBookingData(completion: @escaping (BookingInfo?, Error?) -> ()) {
        fetchGenericJsonData(urlString: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff", completion: completion)
    }
    
    //MARK: Generic
    
    private func fetchGenericJsonData<T:Decodable> (urlString: String, completion: @escaping (T?, Error?) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(nil, DataError.invalidUrl)
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(nil, error)
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(nil, DataError.invalidResponse)
                
                return
            }
            
            guard let data = data else {
                completion(nil, DataError.invalidData)
                
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result, nil)
                
            } catch {
                completion(nil, error)
            }
            
        }.resume()
    }
}
