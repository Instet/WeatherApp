//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 21.08.2022.
//

import Foundation
import UIKit


protocol NetworkServiceDelegate: AnyObject {
    func fetchWeather(_ networking: NetworkService, _ modelWeather: Weather)
    func fetchFailError(_ error: Error)
}

protocol NetworkServiceProtocol {
    func fetchLocationWeather(longitude: Double, latitute: Double)
}

class NetworkService: NetworkServiceProtocol {

    private let mainQueue = DispatchQueue.main
    var units: String = "metric"
    var dataDelegate: NetworkServiceDelegate?

    private let dataKey: [UInt8] = [0x34, 0x61, 0x61, 0x33, 0x31, 0x65, 0x36, 0x38,
                                    0x62, 0x37, 0x32, 0x36, 0x33, 0x35, 0x65, 0x36,
                                    0x63, 0x35, 0x62, 0x64, 0x32, 0x65, 0x34, 0x30,
                                    0x37, 0x38, 0x31, 0x65, 0x35, 0x34, 0x36, 0x39]

    private lazy var urlComponents: URLComponents = {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "api.openweathermap.org"
        component.path = "/data/2.5/onecall"
        return component
    }()


// MARK: - getting weather by geolocation
    func fetchLocationWeather(longitude: Double, latitute: Double) {
        let keyApi = fetchApiKeyString()
        urlComponents.queryItems = []
        urlComponents.queryItems = [
            URLQueryItem(name: "lang", value: "ru"),
            URLQueryItem(name: "units", value: units),
            URLQueryItem(name: "exclude", value: "minutely,alerts"),
            URLQueryItem(name: "appid", value: keyApi),
            URLQueryItem(name: "lat", value: "\(latitute)"),
            URLQueryItem(name: "lon", value: "\(longitude)")
        ]
        if let url = urlComponents.url?.absoluteString {
//            print(url)
            perfomeUpdateRequest(url: url)
        } else {
            self.dataDelegate?.fetchFailError(NetworkError.serverError)
        }
    }

    private func fetchApiKeyString() -> String {
        let data = Data(dataKey)
        let key = String(data: data, encoding: .utf8)
        return key ?? ""
    }

    private func perfomRequest(url: String, comletion: @escaping (Result<Data, NetworkError>) -> Void ) {
        if let url = URL(string: url) {
            mainQueue.async {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard error == nil else {
                        comletion(.failure(.serverError))
                        return
                    }
                    if let data = data {
                        comletion(.success(data))
//                        let stringJSON = String(data: data, encoding: .utf8)
//                        print(stringJSON!)
                    }
                }
                task.resume()
            }
        }
    }

    private func parseJSON(weatherData data: Data) -> Weather? {
        let decoder = JSONDecoder()

        do {
            let decoderData = try decoder.decode(Weather.self, from: data)
            return decoderData
        } catch {
            return nil
        }
    }

     func perfomeUpdateRequest(url: String) {
        perfomRequest(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print(data)
                if let weather = self.parseJSON(weatherData: data) {
                    self.dataDelegate?.fetchWeather(self, weather)
                }
            case .failure(let error):
                self.dataDelegate?.fetchFailError(error)
            }
        }
    }

}
