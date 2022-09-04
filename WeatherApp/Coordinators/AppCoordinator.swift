//
//  MainCoordinator.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 22.08.2022.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {

    var navigationController: UINavigationController? { get set }

    func start()
    func startApp()
    func poptoRootVC()
}


class AppCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController?
    var bulider: BuilderModuleProtocol?

    init(navigationController: UINavigationController?, bulider: BuilderModuleProtocol?) {
        self.navigationController = navigationController
        self.bulider = bulider
    }

    func start() {
        let presenter = OnBoardingPresenter()
        let vc = OnBoardingViewController(presenter: presenter)
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }

    func startApp() {
        if let navigationController = navigationController {
            guard let pageViewController = bulider?.creatMainScreen(coordinator: self) else { return }
            navigationController.pushViewController(pageViewController, animated: false)
        }
    }

    
    func poptoRootVC() {
        navigationController?.popToRootViewController(animated: true)
    }


    
}
