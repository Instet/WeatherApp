//
//  BuilderModule.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 31.08.2022.
//

import Foundation
import UIKit

protocol BuilderModuleProtocol {
    func creatMainScreen(coordinator: CoordinatorProtocol) -> UIViewController
}

final class BuilderModule: BuilderModuleProtocol {

    func creatMainScreen(coordinator: CoordinatorProtocol) -> UIViewController {
        let networkServise = NetworkService()
        let view = MainScreenViewController()
        let presenter = MainPresenter(view: view, networkService: networkServise, coordinator: coordinator)
        view.presenter = presenter
        return view
    }
}
