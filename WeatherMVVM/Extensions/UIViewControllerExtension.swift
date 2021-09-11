//
//  UIViewControllerExtension.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 11.09.21.
//

import Foundation
import UIKit

extension UIViewController {

    func presentAlert(_ message: String) {
        let controller = UIAlertController.init(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction.init(title: "OK", style: .default))
        self.present(controller, animated: true)
    }
}
