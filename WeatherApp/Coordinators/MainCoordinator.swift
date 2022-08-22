//
//  MainCoordinator.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 22.08.2022.
//

import Foundation
import UIKit

protocol Coordinator {

    var parentCoordinator: Coordinator? { get set }

    var children: [Coordinator] { get set }

    var navigationController: UINavigationController { get set }

    func start()
}


class MainCoordinator: Coordinator {

    var parentCoordinator: Coordinator?

    var children: [Coordinator] = []

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = OnBoardingViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        print("start app")
    }

    
}
