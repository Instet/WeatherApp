//
//  RootPresenter.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 30.08.2022.
//

import Foundation
import UIKit
import CoreLocation


protocol OnBoardingPresenterProtocol: AnyObject {
    func requestLocation(completion: @escaping () -> Void)
}

class OnBoardingPresenter: LocationServiceDelegate, OnBoardingPresenterProtocol {

    let locationService = LocationService()

    func requestLocation(completion: @escaping () -> Void) {
        locationService.delegate = self
        DispatchQueue.main.async {
            self.locationService.startLocationManager()
            if LocationService.location != nil {
                UserDefaults().set(true, forKey: "isLocationDid")
                self.locationService.locationManager.stopUpdatingLocation()
            } else {
                self.locationService.locationManager.startUpdatingLocation()
            }

            if UserDefaults().bool(forKey: "isLocationDid") == true {
                completion()
            }

        }
    }


    func didUpdateLocation() {
        self.requestLocation {
            print("go to main")
        }
    }

}
