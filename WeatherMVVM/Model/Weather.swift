//
//  Weather.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import Foundation

struct Weather: Codable {

    let latitude: Double
    let longitude: Double
    let daily: Daily
}

struct Daily: Codable {
    let summary: String
    let icon: String
    let data: [Data]
}

struct Data: Codable {
    let time: Date
    let icon: String
    let precipType: String
    let temperatureMin: Int
}
