//
//  NetworkManager.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 11.09.21.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    private init() {}

    private func request<T: Codable>(type: T.Type, urlRequest: URLRequest,
                                     completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let dataDecoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(dataDecoded))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }

    func getWeather(_ city: City, completion: @escaping (Result<Weather, Error>) -> Void) {
        let urlString = "\(Endpoints.Get.weather.url)\(city.location.0),\(city.location.1)"
        guard let serviceUrl = URL(string: urlString) else {
            print("Error building URL object")
            return
        }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"

        self.request(type: Weather.self, urlRequest: request) { response in
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
}
