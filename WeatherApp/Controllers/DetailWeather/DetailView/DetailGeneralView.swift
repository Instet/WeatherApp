//
//  DetailGeneralView.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 08.09.2022.
//

import UIKit

class DetailGeneralView: UIView {

    var isNight: Bool

    // add options

    var day: Daily? {
        didSet {
            guard let day = day else { return }
            guard let weatherId = day.weather.first?.id else { return }
            statusImage.image = ImageSet.getImageFromId(id: weatherId)
            descriptionWeather.text = day.weather.first?.weatherDescription.firstUppercased
            if isNight {
                temperatureLabel.text = String(format: "%.0f", day.temp.night) + "\u{00B0}"
                feltWeather.value = String(format: "%.0f", day.feelsLike.night) + "\u{00B0}"
            } else {
                temperatureLabel.text = String(format: "%.0f", day.temp.day) + "\u{00B0}"
                feltWeather.value = String(format: "%.0f", day.feelsLike.day) + "\u{00B0}"
            }
            windWeather.value = String(format: "%.0f", day.windSpeed) + "м/с"
            indexUV.value = String(format: "%.0f", day.uvi)
            cloudinessWeather.value = String(day.clouds) + "%"
            rainWeather.value = String(format: "%.0f", day.pop * 100) + "%"
        }
    }



    var title: String? {
        didSet {
            guard let title = title else { return }
            titleLabel.text = title
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = CustomLabel(text: "----",
                                textColor: .black,
                                font: UIFont.rubikRegular18)
        return label
    }()

    private lazy var statusImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var temperatureLabel: UILabel = {
        let label = CustomLabel(text: "--\u{00B0}",
                                textColor: .black,
                                font: UIFont.rubikRegular30)
        return label
    }()

    private lazy var descriptionWeather: UILabel = {
        let label = CustomLabel(text: "-----",
                                textColor: .black,
                                font: UIFont.rubikMedium18)
        return label
    }()

    private lazy var feltWeather: CustomDetailView = {
        let view = CustomDetailView()
        view.image = ImageSet.hot.rawValue
        view.title = "По ощущениям"
        view.value = "--\u{00B0}"
        return view
    }()

    private lazy var windWeather: CustomDetailView = {
        let view = CustomDetailView()
        view.image = ImageSet.wind.rawValue
        view.title = "Ветер"
        view.value = "-- м/с --"
        return view
    }()

    private lazy var indexUV: CustomDetailView = {
        let view = CustomDetailView()
        view.image = ImageSet.clear.rawValue
        view.title = "УФ индекс"
        view.value = "-(----)"
        return view
    }()

    private lazy var rainWeather: CustomDetailView = {
        let view = CustomDetailView()
        view.image = ImageSet.shower.rawValue
        view.title = "Дождь"
        view.value = "--%"
        return view
    }()

    private lazy var cloudinessWeather: CustomDetailView = {
        let view = CustomDetailView()
        view.image = ImageSet.overcast.rawValue
        view.title = "Облачность"
        view.value = "--%"
        return view
    }()


    init(isNight: Bool) {
        self.isNight = isNight
        super.init(frame: .zero)
        setupLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = ColorSet.colorSet(.backgroundPath)
        layer.cornerRadius = 5

        let stackView = UIStackView(arrangedSubviews: [statusImage, temperatureLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.alignment = .center

        addSubviews(titleLabel, stackView, descriptionWeather, feltWeather,
                    windWeather, indexUV, rainWeather, cloudinessWeather)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 100),
            stackView.heightAnchor.constraint(equalToConstant: 37),

            descriptionWeather.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionWeather.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),

            feltWeather.topAnchor.constraint(equalTo: descriptionWeather.bottomAnchor, constant: 15),
            feltWeather.leadingAnchor.constraint(equalTo: leadingAnchor),
            feltWeather.trailingAnchor.constraint(equalTo: trailingAnchor),
            feltWeather.heightAnchor.constraint(equalToConstant: 45),

            windWeather.topAnchor.constraint(equalTo: feltWeather.bottomAnchor),
            windWeather.leadingAnchor.constraint(equalTo: leadingAnchor),
            windWeather.trailingAnchor.constraint(equalTo: trailingAnchor),
            windWeather.heightAnchor.constraint(equalToConstant: 45),

            indexUV.topAnchor.constraint(equalTo: windWeather.bottomAnchor),
            indexUV.leadingAnchor.constraint(equalTo: leadingAnchor),
            indexUV.trailingAnchor.constraint(equalTo: trailingAnchor),
            indexUV.heightAnchor.constraint(equalToConstant: 45),

            rainWeather.topAnchor.constraint(equalTo: indexUV.bottomAnchor),
            rainWeather.leadingAnchor.constraint(equalTo: leadingAnchor),
            rainWeather.trailingAnchor.constraint(equalTo: trailingAnchor),
            rainWeather.heightAnchor.constraint(equalToConstant: 45),

            cloudinessWeather.topAnchor.constraint(equalTo: rainWeather.bottomAnchor),
            cloudinessWeather.leadingAnchor.constraint(equalTo: leadingAnchor),
            cloudinessWeather.trailingAnchor.constraint(equalTo: trailingAnchor),
            cloudinessWeather.heightAnchor.constraint(equalToConstant: 45),

        ])

        
    }
}
