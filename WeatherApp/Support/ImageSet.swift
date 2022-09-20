//
//  ImageSet.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 16.08.2022.
//

import Foundation
import UIKit

enum ImageSet: String {

    case cloud1, cloud2, cloud3
    case womanImage, onBoarding
    case arrowNext, bal, calendar
    case clear, clock, cloudy
    case cold, degree, ellipse
    case fan, geo, hot
    case humidity, moderateRain, moon
    case overcast, partly_cloud, partly_cloudImage
    case rain, redact, settings
    case show, shower, sunrise, snow
    case sunset, thermometer, thunderstorm
    case wind, windImage, fog, arrowPop

    static func getImageFromId(id: Int) -> UIImage? {
        switch id {
        case 200...232:
            return UIImage(named: ImageSet.thunderstorm.rawValue)
        case 300...321:
            return UIImage(named: ImageSet.shower.rawValue)
        case 500...531:
            return UIImage(named: ImageSet.rain.rawValue)
        case 600...622:
            return UIImage(named: ImageSet.snow.rawValue)
        case 701...781:
            return UIImage(named: ImageSet.fog.rawValue)
        case 800:
            return UIImage(named: ImageSet.clear.rawValue)
        case 801...804:
            return UIImage(named: ImageSet.overcast.rawValue)
        default:
            return nil
        }
    }

}
