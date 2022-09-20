//
//  Options.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 08.09.2022.
//

import Foundation

enum SettingsKey: String {
    case temperature
    case windSpeed
    case timeFormat
}

enum Temperature {
    case celsius
    case fahrenheit
}

enum WindSpeed {
    case kilometers
    case miles
}

enum TimeFormat {
    case hours12
    case hours24
}

class Options {
    
    var temperature: Temperature = .celsius
    var windSpeed: WindSpeed = .kilometers
    var timeFormat: TimeFormat = .hours24
}


func getUserDefaultsSettings() -> Options {
    let temperature = UserDefaults.standard.object(forKey: SettingsKey.temperature.rawValue) as? String ?? "C"
    let options = Options()

    if temperature == "C" {
        options.temperature = .celsius
    } else {
        options.temperature = .fahrenheit
    }

    let wind = UserDefaults.standard.object(forKey: SettingsKey.windSpeed.rawValue) as? String ?? "Km"
    if wind == "Km" {
        options.windSpeed = .kilometers
    } else {
        options.windSpeed = .miles
    }

    let time = UserDefaults.standard.object(forKey: SettingsKey.timeFormat.rawValue) as? String ?? "24"
    if time == "24" {
        options.timeFormat = .hours24
    } else {
        options.timeFormat = .hours12
    }
    return options
}



func convertTemp(_ temperature: Double, to format: Temperature) -> String {
    var temp = temperature
    if format == .fahrenheit {
        temp = temp * 9 / 5 + 32
        return String(Int(temp)) + "\u{00B0}F"
    }
    return String(Int(temp)) + "\u{00B0}"
}

func convertSpeed(_ speed: Double, to format: WindSpeed) -> String {
    var temp = speed
    if format == .miles {
        temp = temp * 2.237
        return String(format: "%.2f" ,temp) + "mph"
    }
    return String(format: "%.2f" ,temp) + "м/с"
}

func formatDate(_ format: TimeFormat) -> String {
    if format == .hours12 {
        return "h:mm a"
    }
    return "HH:mm"
}
