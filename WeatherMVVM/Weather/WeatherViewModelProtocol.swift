//
//  WeatherViewModelProtocol.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import Foundation

protocol WeatherViewModelProtocol {

    var weathers: [String: Weather]? { get set }
    var weather: Weather? { get }
    var city: City { get set }

    func fetchWeathers(_ handler: @escaping ((Error?) -> Void))
}
