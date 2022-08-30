//
//  HourlyWeatherForecastCell.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 28.08.2022.
//

import UIKit

class HourlyWeatherForecastCell: UICollectionViewCell {

    private lazy var backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 22
        view.layer.borderWidth = 0.5
        view.layer.borderColor = ColorSet.colorSet(.border).cgColor
        return view
    }()

    private lazy var timeLabel: UILabel = {
        let label = CustomLabel(text: "--:--", textColor: .black, font: UIFont.rubikRegular14)
        return label
    }()

    private lazy var statusImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var tempLabel: UILabel = {
        let label = CustomLabel(text: "--°", textColor: .black, font: UIFont.rubikRegular16)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // debug layout
    func array(string: String) {
        timeLabel.text = string
    }


    private func setupLayout() {
        contentView.addSubviews(backgroundCell)

        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        backgroundCell.addSubviews(timeLabel, statusImage, tempLabel)

        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 15),
            timeLabel.centerXAnchor.constraint(equalTo: backgroundCell.centerXAnchor),

            statusImage.widthAnchor.constraint(equalToConstant: 16),
            statusImage.heightAnchor.constraint(equalToConstant: 16),
            statusImage.centerXAnchor.constraint(equalTo: backgroundCell.centerXAnchor),
            statusImage.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),

            tempLabel.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -8),
            tempLabel.centerXAnchor.constraint(equalTo: backgroundCell.centerXAnchor)
        ])
    }
    
}
