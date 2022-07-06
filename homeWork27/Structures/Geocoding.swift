//
//  Geocoding.swift
//  homeWork27
//
//  Created by Валерий Вергейчик on 28.06.22.
//

import Foundation

struct Geocoding: Codable {
    var cityName: String?
    var lat: Double
    var lon: Double
    var country: String?
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, country
        case cityName = "name"
    }
}
