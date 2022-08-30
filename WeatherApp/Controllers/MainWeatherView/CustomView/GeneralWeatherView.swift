//
//  GeneralWeatherView.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 27.08.2022.
//

import UIKit

final class GeneralWeatherView: UIView {

    // MARK: - UI General Elemens
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorSet.colorSet(.blue)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
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

    // MARK: - Rainfall in mm
    private lazy var rainfallView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var rainfallImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.partly_cloud.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var rainfallLabel: UILabel = {
        let label = CustomLabel(text: "-", textColor: .white, font: UIFont.rubikRegular14)
        label.numberOfLines = 1
        return label
    }()

    // MARK: - Wind data
    private lazy var windDataView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var windDataImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.wind.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var windDataLabel: UILabel = {
        let label = CustomLabel(text: "- м/c", textColor: .white, font: UIFont.rubikRegular14)
        label.numberOfLines = 1
        return label
    }()

    // MARK: - Chance of rain
    private lazy var chanceRainView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var chanceRainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.rain.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var chanceRainLabel: UILabel = {
        let label = CustomLabel(text: "--%", textColor: .white, font: UIFont.rubikRegular14)
        label.numberOfLines = 1
        return label
    }()


    // MARK: - GeneralDate
    private lazy var dateLabel: UILabel = {
        let label = CustomLabel(text: "--", textColor: ColorSet.colorSet(.yellow), font: UIFont.rubikRegular16)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()

    // MARK: - Sunrise end sunset

    private lazy var sunriseImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.sunrise.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var sunsetImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.sunset.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var sunriseTimeLabel: UILabel = {
        let label = CustomLabel(text: "--:--", textColor: .white, font: UIFont.rubikMedium14)
        label.numberOfLines = 1
        return label
    }()

    private lazy var sunsetTimeLabel: UILabel = {
        let label = CustomLabel(text: "--:--", textColor: .white, font: UIFont.rubikMedium14)
        label.numberOfLines = 1
        return label
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup view elements
    private func setupLayout() {
        addSubviews(backgroundView)

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        backgroundView.addSubviews(ellipseImage, generalWeatherLabel, currentTempLabel, descriptionTempLabel)

        NSLayoutConstraint.activate([
            ellipseImage.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 17),
            ellipseImage.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            ellipseImage.widthAnchor.constraint(equalToConstant: 280),
            ellipseImage.heightAnchor.constraint(equalToConstant: 123),

            generalWeatherLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 33),
            generalWeatherLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),

            currentTempLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 58),
            currentTempLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),

            descriptionTempLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 103),
            descriptionTempLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            descriptionTempLabel.widthAnchor.constraint(equalToConstant: 230)
        ])

        backgroundView.addSubviews(rainfallView)
        rainfallView.addSubviews(rainfallImage, rainfallLabel)

        NSLayoutConstraint.activate([
            rainfallImage.topAnchor.constraint(equalTo: rainfallView.topAnchor),
            rainfallImage.leadingAnchor.constraint(equalTo: rainfallView.leadingAnchor),
            rainfallImage.widthAnchor.constraint(equalToConstant: 20),
            rainfallImage.heightAnchor.constraint(equalToConstant: 18),
            rainfallImage.bottomAnchor.constraint(equalTo: rainfallView.bottomAnchor),

            rainfallLabel.centerYAnchor.constraint(equalTo: rainfallView.centerYAnchor),
            rainfallLabel.leadingAnchor.constraint(equalTo: rainfallImage.trailingAnchor, constant: 3),
            rainfallLabel.trailingAnchor.constraint(equalTo: rainfallView.trailingAnchor),
            rainfallLabel.widthAnchor.constraint(equalToConstant: 10)

        ])

        backgroundView.addSubviews(windDataView)
        windDataView.addSubviews(windDataImage, windDataLabel)

        NSLayoutConstraint.activate([
            windDataImage.topAnchor.constraint(equalTo: windDataView.topAnchor),
            windDataImage.leadingAnchor.constraint(equalTo: windDataView.leadingAnchor),
            windDataImage.widthAnchor.constraint(equalToConstant: 20),
            windDataImage.heightAnchor.constraint(equalToConstant: 18),
            windDataImage.bottomAnchor.constraint(equalTo: windDataView.bottomAnchor),

            windDataLabel.centerYAnchor.constraint(equalTo: windDataView.centerYAnchor),
            windDataLabel.leadingAnchor.constraint(equalTo: windDataImage.trailingAnchor, constant: 3),
            windDataLabel.widthAnchor.constraint(equalToConstant: 45),
            windDataLabel.trailingAnchor.constraint(equalTo: windDataView.trailingAnchor)
        ])

        backgroundView.addSubviews(chanceRainView)
        chanceRainView.addSubviews(chanceRainImage, chanceRainLabel)

        NSLayoutConstraint.activate([
            chanceRainImage.topAnchor.constraint(equalTo: chanceRainView.topAnchor),
            chanceRainImage.leadingAnchor.constraint(equalTo: chanceRainView.leadingAnchor),
            chanceRainImage.widthAnchor.constraint(equalToConstant: 20),
            chanceRainImage.heightAnchor.constraint(equalToConstant: 18),
            chanceRainImage.bottomAnchor.constraint(equalTo: chanceRainView.bottomAnchor),

            chanceRainLabel.centerYAnchor.constraint(equalTo: chanceRainView.centerYAnchor),
            chanceRainLabel.leadingAnchor.constraint(equalTo: chanceRainImage.trailingAnchor, constant: 3),
            chanceRainLabel.widthAnchor.constraint(equalToConstant: 40),
            chanceRainLabel.trailingAnchor.constraint(equalTo: chanceRainView.trailingAnchor)
        ])

        let stackView = UIStackView(arrangedSubviews: [rainfallView, windDataView, chanceRainView])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 20

        backgroundView.addSubviews(stackView, dateLabel, sunriseImage, sunsetImage, sunriseTimeLabel, sunsetTimeLabel)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 131),
            stackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),

            dateLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 171),
            dateLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),

            sunriseImage.topAnchor.constraint(equalTo: ellipseImage.bottomAnchor, constant: 2),
            sunriseImage.widthAnchor.constraint(equalToConstant: 17),
            sunriseImage.heightAnchor.constraint(equalToConstant: 17),
            sunriseImage.centerXAnchor.constraint(equalTo: ellipseImage.leadingAnchor, constant: 3),

            sunsetImage.topAnchor.constraint(equalTo: ellipseImage.bottomAnchor, constant: 2),
            sunsetImage.widthAnchor.constraint(equalToConstant: 17),
            sunsetImage.heightAnchor.constraint(equalToConstant: 17),
            sunsetImage.centerXAnchor.constraint(equalTo: ellipseImage.trailingAnchor, constant: -3),

            sunriseTimeLabel.topAnchor.constraint(equalTo: sunriseImage.bottomAnchor, constant: 5),
            sunriseTimeLabel.centerXAnchor.constraint(equalTo: sunriseImage.centerXAnchor),

            sunsetTimeLabel.topAnchor.constraint(equalTo: sunsetImage.bottomAnchor, constant: 5),
            sunsetTimeLabel.centerXAnchor.constraint(equalTo: sunsetImage.centerXAnchor)
        ])


    }






}
