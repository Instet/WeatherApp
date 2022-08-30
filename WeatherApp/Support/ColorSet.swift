//
//  ColorSet.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 16.08.2022.
//

import Foundation
import UIKit

public enum ColorSet {

    case blue
    case yellow
    case orange
    case orangeDark
    case beige
    case backgroundPath
    case green
    case gray
    case border

    static func colorSet(_ color: ColorSet) -> UIColor {
        switch color {
        case .blue:
            return UIColor(named: "Blue")!
        case .yellow:
            return UIColor(named: "Yellow")!
        case .orange:
            return UIColor(named: "Orange")!
        case .orangeDark:
            return UIColor(named: "OrangeDark")!
        case .beige:
            return UIColor(named: "Beige")!
        case .backgroundPath:
            return UIColor(named: "BackgroundPath")!
        case .green:
            return UIColor(named: "Green")!
        case .gray:
            return UIColor(named: "Gray")!
        case .border:
            return UIColor(named: "Border")!
        }
    }


}
