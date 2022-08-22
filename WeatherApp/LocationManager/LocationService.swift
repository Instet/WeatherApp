//
//  LocationService.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 20.08.2022.
//

import CoreLocation

 class LocationService: NSObject {

     private let locationManager: CLLocationManager

     static var curentLocation: CLLocationCoordinate2D?

     override init() {
         locationManager = CLLocationManager()
         super.init()
         locationManager.delegate = self
     }

    func startLocationManager() {
 // добавить проверку
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation()
    }

}

//MARK: - CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else { return }
        LocationService.curentLocation = userLocation.coordinate

    }

}



