//
//  PagePresenter.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 26.08.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {

}

protocol MainViewPresenterProtocol: AnyObject {
    var coordinator: CoordinatorProtocol? { get }
    init(view: MainViewProtocol, coordinator: CoordinatorProtocol)

}

final class MainPresenter: MainViewPresenterProtocol {

    weak var view: MainViewProtocol?
    var coordinator: CoordinatorProtocol?


    init(view: MainViewProtocol, coordinator: CoordinatorProtocol) {
        self.view = view
        self.coordinator = coordinator

    }

}

