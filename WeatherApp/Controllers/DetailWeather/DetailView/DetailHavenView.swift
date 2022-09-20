//
//  DetailHavenView.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 12.09.2022.
//

import UIKit

class DetailHavenView: UIView {

    var timezoneOffset: Double = 0

    var day: Daily? {
        didSet {
            guard let day = day else { return }

            // add option
            
            timeSunSunrise.text = dataInDate(day.sunrise + timezoneOffset, formatDate(.hours24) , nil)
            timeSunSunset.text = dataInDate(day.sunset + timezoneOffset, formatDate(.hours24) , nil)
            timeMoonSunrise.text = dataInDate(day.moonrise + timezoneOffset, formatDate(.hours24) , nil)
            timeMoonSunset.text = dataInDate(day.sunset + timezoneOffset, formatDate(.hours24) , nil)
        }
    }


    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = CustomLabel(text: "Солнце и Луна",
                                textColor: .black,
                                font: .rubikRegular18)
        return label
    }()

    // MARK: - Sun
    private lazy var sunImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.clear.rawValue)
        image.contentMode = .scaleAspectFill
        return image
    }()


    private lazy var sunSunrise: UILabel = {
        let label = CustomLabel(text: "Восход",
                                textColor: ColorSet.colorSet(.gray),
                                font: .rubikRegular14)
        return label
    }()

    private lazy var timeSunSunrise: UILabel = {
        let label = CustomLabel(text: "--:--",
                                textColor: .black,
                                font: .rubikRegular16)
        return label
    }()

    private lazy var timeSunSunset: UILabel = {
        let label = CustomLabel(text: "--:--",
                                textColor: .black,
                                font: .rubikRegular16)
        return label
    }()

    private lazy var sunSunset: UILabel = {
        let label = CustomLabel(text: "Заход",
                                textColor: ColorSet.colorSet(.gray),
                                font: .rubikRegular14)
        return label
    }()


    //MARK: - Moon
    private lazy var moonImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.moon.rawValue)
        image.contentMode = .scaleAspectFill
        return image
    }()

    private lazy var moonSunrise: UILabel = {
        let label = CustomLabel(text: "Восход",
                                textColor: ColorSet.colorSet(.gray),
                                font: .rubikRegular14)
        return label
    }()


    private lazy var moonSunset: UILabel = {
        let label = CustomLabel(text: "Заход",
                                textColor: ColorSet.colorSet(.gray),
                                font: .rubikRegular14)
        return label
    }()

    private lazy var timeMoonSunrise: UILabel = {
        let label = CustomLabel(text: "--:--",
                                textColor: .black,
                                font: .rubikRegular16)
        return label
    }()

    private lazy var timeMoonSunset: UILabel = {
        let label = CustomLabel(text: "--:--",
                                textColor: .black,
                                font: .rubikRegular16)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupLayout() {
        addSubviews(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        contentView.addSubviews(titleLabel, sunImageView, sunSunrise, sunSunset, timeSunSunrise, timeSunSunset,
                                moonImageView, moonSunrise, moonSunset, timeMoonSunrise, timeMoonSunset)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            //MARK: - sun block

            sunImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            sunImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 18),
            sunImageView.widthAnchor.constraint(equalToConstant: 20),
            sunImageView.heightAnchor.constraint(equalTo: sunImageView.widthAnchor),

            sunSunrise.topAnchor.constraint(equalTo: sunImageView.bottomAnchor, constant: 20),
            sunSunrise.leadingAnchor.constraint(equalTo: sunImageView.leadingAnchor),

            sunSunset.topAnchor.constraint(equalTo: sunSunrise.bottomAnchor, constant: 17),
            sunSunset.leadingAnchor.constraint(equalTo: sunSunrise.leadingAnchor),

            timeSunSunrise.topAnchor.constraint(equalTo: sunSunrise.topAnchor),
            timeSunSunrise.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -17),

            timeSunSunset.topAnchor.constraint(equalTo: sunSunset.topAnchor),
            timeSunSunset.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -17),

            //MARK: - moon block

            moonImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            moonImageView.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 27),
            moonImageView.widthAnchor.constraint(equalToConstant: 20),
            moonImageView.heightAnchor.constraint(equalTo: moonImageView.widthAnchor),

            moonSunrise.topAnchor.constraint(equalTo: moonImageView.bottomAnchor, constant: 20),
            moonSunrise.leadingAnchor.constraint(equalTo: moonImageView.leadingAnchor),

            moonSunset.topAnchor.constraint(equalTo: moonSunrise.bottomAnchor, constant: 17),
            moonSunset.leadingAnchor.constraint(equalTo: moonSunrise.leadingAnchor),

            timeMoonSunrise.topAnchor.constraint(equalTo: moonSunrise.topAnchor),
            timeMoonSunrise.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            timeMoonSunset.topAnchor.constraint(equalTo: moonSunset.topAnchor),
            timeMoonSunset.trailingAnchor.constraint(equalTo: timeMoonSunrise.trailingAnchor)
        ])
    }



}
