//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 03.09.2022.
//

import Foundation
import UIKit

protocol WeatherViewProtocol: AnyObject {

}

protocol WeatherPresenterProtocol: AnyObject {
    var currentLocation: Location? { get set }
    var hours: [Hourly] { get set }
    var days: [Daily] { get set }
    func getCurrentLocationWeather()
}

final class WeatherPresenter: WeatherPresenterProtocol {
    weak var view: WeatherViewProtocol?
    var currentLocation: Location?
    var hours: [Hourly] = []
    var days: [Daily]  = []
    var weather: Weather?
    let networkService = NetworkService()
    let locationService = LocationService()


    func getCurrentLocationWeather() {
        DispatchQueue.global().async { [self] in
            self.currentLocation = self.locationService.getCurrentLocation()
            if currentLocation == nil {
                self.currentLocation = self.locationService.getCurrentLocation()
                print(currentLocation as Any)
                return
            }
            self.networkService.fetchLocationWeather(longitude: currentLocation!.lon, latitute: currentLocation!.lat)

        }
    }


    
     func getHoursFromWeather(from weather: Weather) -> [Hourly] {
        var hours = [Hourly]()
        let hoursFromNet = weather.hourly
        for hour in hoursFromNet {
            hours.append(hour)
        }
        if hours.count > 24 {
            hours = hours.enumerated().filter { $0.offset < 24 && $0.offset % 3 == 0 }.map { $0.element }
        }
        return hours
    }

     func getDailyFromWeather(from weather: Weather) -> [Daily] {
        var daily = [Daily]()
        let dailyFromNet = weather.daily
        for day in dailyFromNet {
            daily.append(day)
        }
        return daily
    }

}


