//
//  LocationService.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 20.08.2022.
//

import CoreLocation

protocol LocationServiceDelegate: AnyObject {
    func didUpdateLocation()
}

class LocationService: NSObject {

    weak var delegate: LocationServiceDelegate?
    let locationManager = CLLocationManager()
    static var location: Location?
    public var curentLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters

    }

    func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func getCurrentLocation() -> Location? {
        return LocationService.location
    }
}

//MARK: - CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else { return }
        LocationService.location = Location(lat: userLocation.coordinate.latitude, lon: userLocation.coordinate.longitude)
        self.delegate?.didUpdateLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

}



