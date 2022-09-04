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
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol)

}

final class MainPresenter: MainViewPresenterProtocol {

    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var coordinator: CoordinatorProtocol?


    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol) {
        self.view = view
        self.networkService = networkService
        self.coordinator = coordinator
       
    }

}

