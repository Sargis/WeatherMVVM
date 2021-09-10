//
//  Coordinator.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import Foundation
import UIKit

protocol Coordinator {
    func start() -> UIViewController
}

extension Coordinator {

    func start() -> UIViewController {
        fatalError("start function must be implement")
    }
}
