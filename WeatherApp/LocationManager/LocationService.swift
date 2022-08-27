//
//  LocationService.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 20.08.2022.
//

import CoreLocation

class LocationService: NSObject {

    private let locationManager: CLLocationManager
    public var curentLocation: CLLocationCoordinate2D?

    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }

    func startLocationManager() {
        locationManager.delegate = self
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("отклонен")
        @unknown default:
            fatalError()
        }
    }
}

//MARK: - CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else { return }
        self.curentLocation = userLocation.coordinate



    }

}



