//
//  WeatherViewModel.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import Foundation

class WeatherViewModel: WeatherViewModelProtocol {

    var weathers: [String: Weather]?
    var city: City
    var weather: Weather? {
        return self.weathers?[self.city.description]
    }

    init(_ city: City) {
        self.city = city
        self.weathers = [:]
    }

    func fetchWeathers(_ completion: @escaping ((Error?) -> Void)) {
        NetworkManager.shared.getWeather(self.city) { response in
            switch response {
            case .success(let weather):
                self.weathers?[self.city.description] = weather
                completion(nil)
            case.failure(let error):
                print(error.localizedDescription)
                completion(error)
            }
        }
    }
}
