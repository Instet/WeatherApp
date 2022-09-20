//
//  DailyWeatherForecastCell.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 28.08.2022.
//

import UIKit

class DailyWeatherForecastCell: UITableViewCell {

    var option = Options()

    private lazy var backgroundCell: UIView = {
        let view = UIView()
        view.backgroundColor = ColorSet.colorSet(.backgroundPath)
        view.layer.cornerRadius = 5
        return view
    }()

    private lazy var dateLabel: UILabel = {
        let label = CustomLabel(text: "--/--", textColor: .lightGray, font: UIFont.rubikRegular16)
        label.textAlignment = .left
        return label
    }()

    private lazy var descriptionTitleLabel: UILabel = {
        let label = CustomLabel(text: "Нет данных", textColor: .black, font: UIFont.rubikRegular16)
        label.textAlignment = .left
        label.contentMode = .left
        label.numberOfLines = 1
        return label
    }()

    private lazy var tempLabel: UILabel = {
        let label = CustomLabel(text: "--", textColor: .black, font: UIFont.rubikRegular18)
        label.textAlignment = .right
        return label
    }()

    // MARK: - Chance of rain
    private lazy var chanceRainView: UIView = {
        let view = UIView()
        view.sizeToFit()
        return view
    }()

    private lazy var chanceRainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageSet.shower.rawValue)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var chanceRainLabel: UILabel = {
        let label = CustomLabel(text: "--%", textColor: ColorSet.colorSet(.blue), font: UIFont.rubikRegular)
        label.numberOfLines = 1
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        self.selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupLayout() {
        contentView.addSubviews(backgroundCell)

        NSLayoutConstraint.activate([
            backgroundCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundCell.heightAnchor.constraint(equalToConstant: 56),
            backgroundCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        chanceRainView.addSubviews(chanceRainImage, chanceRainLabel)

        NSLayoutConstraint.activate([
            chanceRainImage.topAnchor.constraint(equalTo: chanceRainView.topAnchor),
            chanceRainImage.leadingAnchor.constraint(equalTo: chanceRainView.leadingAnchor),
            chanceRainImage.heightAnchor.constraint(equalToConstant: 17),
            chanceRainImage.widthAnchor.constraint(equalToConstant: 15),
            chanceRainImage.bottomAnchor.constraint(equalTo: chanceRainView.bottomAnchor),

            chanceRainLabel.leadingAnchor.constraint(equalTo: chanceRainImage.trailingAnchor, constant: 5),
            chanceRainLabel.centerYAnchor.constraint(equalTo: chanceRainView.centerYAnchor),
            chanceRainLabel.trailingAnchor.constraint(equalTo: chanceRainView.trailingAnchor)
        ])

        backgroundCell.addSubviews(dateLabel, chanceRainView, descriptionTitleLabel, tempLabel)

        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 6),

            chanceRainView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
            chanceRainView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            chanceRainView.widthAnchor.constraint(equalToConstant: 45),

            descriptionTitleLabel.leadingAnchor.constraint(equalTo: chanceRainView.trailingAnchor, constant: 13),
            descriptionTitleLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),

            tempLabel.centerYAnchor.constraint(equalTo: descriptionTitleLabel.centerYAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            tempLabel.leadingAnchor.constraint(equalTo: descriptionTitleLabel.trailingAnchor, constant: 3)
        ])
    }

    func configCell(_ daily: Daily) {
        chanceRainImage.image = ImageSet.getImageFromId(id: daily.weather[0].id)
        dateLabel.text = dataInDate(daily.dt, "dd/MM", nil)
        chanceRainLabel.text = String(format: "%.0f" ,daily.pop * 100) + "%"
        descriptionTitleLabel.text = daily.weather[0].weatherDescription.firstUppercased
        tempLabel.text = convertTemp(daily.temp.min, to: option.temperature) + "-" + convertTemp(daily.temp.max, to: option.temperature) + " >" 
    }



}
