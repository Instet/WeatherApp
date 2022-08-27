//
//  PagePresenter.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 26.08.2022.
//

import Foundation

protocol PageViewProtocol: AnyObject {

}

protocol PageViewPresenterProtocol: AnyObject {
    init(view: PageViewProtocol, networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol)

}

final class PagePresenter: PageViewPresenterProtocol {

    weak var view: PageViewProtocol?
    let networkService: NetworkServiceProtocol!
    var coordinator: CoordinatorProtocol?

    init(view: PageViewProtocol, networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol) {
        self.view = view
        self.networkService = networkService
        self.coordinator = coordinator
    }


}
