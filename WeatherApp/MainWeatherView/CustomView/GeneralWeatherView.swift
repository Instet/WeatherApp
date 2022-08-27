//
//  GeneralWeatherView.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 27.08.2022.
//

import UIKit

final class GeneralWeatherView: UIView {

    // MARK: - UI Elemens
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorSet.colorSet(.blue)
        view.layer.cornerRadius = 5
        return view
    }()

    private lazy var ellipseImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.ellipse.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var generalWeatherLabel: UILabel = {
        let label = CustomLabel(text: "-°/-°", textColor: .white, font: UIFont.rubikRegular16)
        label.numberOfLines = 1
        return label
    }()

    private lazy var currentTempLabel: UILabel = {
        let label = CustomLabel(text: "-°", textColor: .white, font: UIFont.titleMedium)
        label.numberOfLines = 1
        return label
    }()

    private lazy  var descriptionTempLabel: UILabel = {
        let label = CustomLabel(text: "Нет соединения", textColor: .white, font: UIFont.rubikRegular16)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
}
