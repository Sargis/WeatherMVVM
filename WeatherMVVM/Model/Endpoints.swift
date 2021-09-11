//
//  Endpoints.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 11.09.21.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {

    static var root: String {
        return "https://api.darksky.net/"
    }

    enum Get: Endpoint {
        case weather

        var path: String {
            return "forecast/3e7e519ea86c8e3fcf67c0f4870513d7/"
        }

        var url: String {
            return "\(Endpoints.root)\(path)"
        }
    }
}
