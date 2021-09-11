//
//  WeatherCoordinator.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import Foundation
import UIKit

class WeatherCoordinator: WeatherCoordinatorProtool {

    func start() -> UIViewController {
        let weatherController = WeatherViewController()
        weatherController.coordinator = self
        weatherController.viewModel = WeatherViewModel(.moscow)
        return weatherController
    }
}
