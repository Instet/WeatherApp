//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 15.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navCon = UINavigationController()
        self.window?.rootViewController = navCon
        let builder = BuilderModule()
        let coordinator: AppCoordinator = AppCoordinator(navigationController: navCon, bulider: builder)
        coordinator.start()
        self.window?.makeKeyAndVisible()

        return true
    }

}

