//
//  MainCoordinator.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 22.08.2022.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {

    var parentCoordinator: CoordinatorProtocol? { get set }

    var children: [CoordinatorProtocol] { get set }

    var navigationController: UINavigationController { get set }

    func start()
}


class AppCoordinator: CoordinatorProtocol {

    var parentCoordinator: CoordinatorProtocol?

    var children: [CoordinatorProtocol] = []

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        if UserDefaults.standard.bool(forKey: "isWasRun") {
            startApp()
            return
        }
        let vc = OnBoardingViewController()
        vc.coordinator = self
        UserDefaults.standard.set(true, forKey: "isWasRun")
        navigationController.pushViewController(vc, animated: true)
    }

    func startApp() {
        let vc = PageViewController()
        vc.coordinato = self
        navigationController.pushViewController(vc, animated: true)
    }


    
}
