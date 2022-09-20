//
//  CustomDetailView.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 10.09.2022.
//

import UIKit

class CustomDetailView: UIView {

    var value: String? {
        didSet {
            guard let value = value else { return }
            weatherValue.text = value
        }
    }
    var image: String? {
        didSet {
            guard let image = image else { return }
            weatherImage.image = UIImage(named: image)
        }
    }

    var title: String? {
        didSet {
            guard let title = title else { return }
            weatherTitle.text = title
        }
    }

    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var weatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var weatherTitle: UILabel = {
        let label = CustomLabel(text: "---",
                                textColor: .black,
                                font: UIFont.rubikRegular14)
        return label
    }()

    private lazy var weatherValue: UILabel = {
        let label = CustomLabel(text: "--",
                                textColor: .black,
                                font: UIFont.rubikRegular18)
        return label
    }()

    private lazy var separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = ColorSet.colorSet(.blue)
        return view
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

        contentView.addSubviews(weatherImage, weatherTitle, weatherValue, separatorLine)

        NSLayoutConstraint.activate([

            weatherImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            weatherImage.widthAnchor.constraint(equalToConstant: 25),
            weatherImage.heightAnchor.constraint(equalToConstant: 25),
            weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            weatherTitle.centerYAnchor.constraint(equalTo: weatherImage.centerYAnchor),
            weatherTitle.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 15),

            weatherValue.centerYAnchor.constraint(equalTo: weatherTitle.centerYAnchor),
            weatherValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 0.5),
            separatorLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
//            separatorLine.widthAnchor.constraint(equalToConstant: contentView.frame.width)
        ])
    }


}
