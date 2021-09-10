//
//  AppDelegate.swift
//  WeatherMVVM
//
//  Created by Sargis Khachatryan on 10.09.21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let weahterController = WeatherCoordinator().start()
        let nvc = UINavigationController.init(rootViewController: weahterController)
        self.window?.rootViewController = nvc
        self.window?.makeKeyAndVisible()
        return true
    }

}
