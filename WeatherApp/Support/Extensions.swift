//
//  Extensions.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 16.08.2022.
//

import Foundation
import UIKit

// MARK: - extension UIView
public extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }

    func dataInDate(_ data: Double, _ format: String, _ option: String?) -> String {
        let date = Date(timeIntervalSince1970: data)
        let dateFormat = DateFormatter()
        if option == nil {
            dateFormat.dateFormat = format
        } else {
            dateFormat.dateFormat = format + option!
        }
        dateFormat.timeZone = TimeZone(abbreviation: "UTC")
        dateFormat.locale = Locale(identifier: "ru_RU")
        return dateFormat.string(from: date)
    }
}

// MARK: - extension UIColor
public extension UIColor {

    convenience init?(hex: String) {

        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)

        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        let length = hexSanitized.count

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255
            b = CGFloat(rgb & 0x0000FF) / 255
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255
            a = CGFloat(rgb & 0x000000FF) / 255

        } else {
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

// MARK: - extension UIImageView
extension UIImageView {

    static func getImage(_ name: String) -> UIImageView {
        let imageView: UIImageView
        if name.isEmpty {
            imageView = UIImageView()
        } else {
            imageView = UIImageView(image: UIImage(named: name))
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
// MARK: - extension StringProtocol
extension StringProtocol {
    var firstUppercased: String {
        guard let first = first else { return ""}
        return String(first).uppercased() + dropFirst()
    }
}
