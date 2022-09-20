//
//  DatesForecastCell.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 14.09.2022.
//

import UIKit

class DatesForecastCell: UICollectionViewCell {

    var textColor: UIColor? {
        didSet {
            guard let textColor = textColor else { return }
            dateLabel.textColor = textColor
        }
    }

    var colorBackgroundCell: UIColor? {
        didSet {
            guard let colorBackgroundCell = colorBackgroundCell else { return }
            backgroundPath.backgroundColor = colorBackgroundCell

        }
    }

    var day: Daily? {
        didSet {
            guard let day = day else { return }
            dateLabel.text = dataInDate(day.dt, "dd", nil) + "/" + dataInDate(day.dt, "MM E", nil)
        }
    }
    
    private lazy var backgroundPath: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .white
        return view
    }()

    private lazy var dateLabel: UILabel = {
        let label = CustomLabel(text: "--/-- --", textColor: .black, font: .rubikRegular18)
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
        contentView.addSubviews(backgroundPath)

        NSLayoutConstraint.activate([
            backgroundPath.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundPath.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundPath.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundPath.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        backgroundPath.addSubviews(dateLabel)

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: backgroundPath.topAnchor, constant: 7),
            dateLabel.leadingAnchor.constraint(equalTo: backgroundPath.leadingAnchor, constant: 6),
            dateLabel.trailingAnchor.constraint(equalTo: backgroundPath.trailingAnchor, constant: -6),
            dateLabel.bottomAnchor.constraint(equalTo: backgroundPath.bottomAnchor, constant: -7)
        ])

    }
}
