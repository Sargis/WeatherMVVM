//
//  WeatherViewModel.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import Foundation

class WeatherViewModel: WeatherViewModelProtocol {

    var weather: [Weather]?
    var city: City

    init(_ city: City) {
        self.city = city
    }

    func fetchWeathers(_ handler: @escaping ((Error?) -> Void)) {

    }
}
