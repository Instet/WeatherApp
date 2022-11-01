//
//  HourlyViewCell.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 27.09.2022.
//

import UIKit

class HourlyViewCell: UITableViewCell {

    // MARK: - titles
    private lazy var dateLabel: UILabel = {
        let label = CustomLabel(text: "-- --/--", textColor: .black, font: .rubikMedium18)
        return label
    }()

    private lazy var timeLabel: UILabel = {
        let label = CustomLabel(text: "--:--", textColor: .black, font: .rubikRegular14)
        return label
    }()

    private lazy var temperatureLabel: UILabel = {
        let label = CustomLabel(text: "--\u{00B0}", textColor: .black, font: .rubikMedium18)
        return label
    }()

    // MARK: - description Weather
    private lazy var statusWeatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var descripWeatherLabel: UILabel = {
        let label = CustomLabel(text: "--------", textColor: .black, font: .rubikRegular14)
        return label
    }()

    private lazy var stackWeatherDescript: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [statusWeatherImage, descripWeatherLabel])
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = 3
        stack.distribution = .fill
        return stack
    }()

    // MARK: - wind
    private lazy var windImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.wind.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var windLabel: UILabel = {
        let label = CustomLabel(text: "Ветер", textColor: .black, font: .rubikRegular14)
        return label
    }()

    private lazy var valueWindLabel: UILabel = {
        let label = CustomLabel(text: "-- m/c", textColor: .systemGray, font: .rubikRegular14)
        return label
    }()


    // MARK: - rain
    private lazy var rainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.rain.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var rainLabel: UILabel = {
        let label = CustomLabel(text: "Атмосферные осадки", textColor: .black, font: .rubikRegular14)
        return label
    }()

    private lazy var valueRainLabel: UILabel = {
        let label = CustomLabel(text: "-- %", textColor: .systemGray, font: .rubikRegular14)
        return label
    }()


    // MARK: - cloudiness
    private lazy var cloudinessImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.overcast.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var cloudinessLabel: UILabel = {
        let label = CustomLabel(text: "Облачность", textColor: .black, font: .rubikRegular14)
        return label
    }()

    private lazy var valueCloudLabel: UILabel = {
        let label = CustomLabel(text: "-- %", textColor: .systemGray, font: .rubikRegular14)
        return label
    }()

    // MARK: - line view

    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorSet.colorSet(.blue)
        return view
    }()




    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    private func setupLayout() {
        contentView.backgroundColor = ColorSet.colorSet(.backgroundPath)
        contentView.addSubviews(dateLabel, timeLabel, temperatureLabel, stackWeatherDescript)

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timeLabel.widthAnchor.constraint(equalToConstant: 47),

            temperatureLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            temperatureLabel.widthAnchor.constraint(equalToConstant: 25),

            stackWeatherDescript.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            stackWeatherDescript.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 74)

        ])
    }

}
