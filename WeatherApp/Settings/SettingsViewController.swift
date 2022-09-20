//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 19.08.2022.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: доработать согласно макету

    weak var coordinator: AppCoordinator?

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorSet.colorSet(.backgroundPath)
        view.layer.cornerRadius = 10
        return view
    }()

    private var cloudTop = UIImageView.getImage(ImageSet.cloud1.rawValue)
    private var cloudMiddle = UIImageView.getImage(ImageSet.cloud2.rawValue)
    private var cloudBottom = UIImageView.getImage(ImageSet.cloud3.rawValue)

    private lazy var titleSetting: UILabel = {
        let label = CustomLabel(text: "Настройки",
                                textColor: .black,
                                font: UIFont.rubikMedium18)
        return label
    }()


    private lazy var labelTemp: UILabel = {
        let label = CustomLabel(text: "Температура",
                                textColor: ColorSet.colorSet(.gray),
                                font: UIFont.rubikRegular16)
        return label
    }()

    private lazy var labelWindSpeed: UILabel = {
        let label = CustomLabel(text: "Скорость ветра",
                                textColor: ColorSet.colorSet(.gray),
                                font: UIFont.rubikRegular16)
        return label
    }()

    private lazy var labelTimeFormat: UILabel = {
        let label = CustomLabel(text: "Формат времени",
                                textColor: ColorSet.colorSet(.gray),
                                font: UIFont.rubikRegular16)
        return label
    }()

    private lazy var labelNotification: UILabel = {
        let label = CustomLabel(text: "Уведомления",
                                textColor: ColorSet.colorSet(.gray),
                                font: UIFont.rubikRegular16)
        return label
    }()

    private lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelTemp,
                                                   labelWindSpeed,
                                                   labelTimeFormat,
                                                   labelNotification])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 30
        stack.distribution = .fillProportionally
        return stack
    }()

    private lazy var segmentTemp: UISegmentedControl = {
        let segment = CustomSegmentedControll(items: Segments.selectSegmets(.temperature))
        return segment
    }()

    private lazy var segmentWind: UISegmentedControl = {
        let segment = CustomSegmentedControll(items: Segments.selectSegmets(.windSpeed))
        return segment
    }()

    private lazy var segmentTime: UISegmentedControl = {
        let segment = CustomSegmentedControll(items: Segments.selectSegmets(.timeFormat))
        return segment
    }()

    private lazy var segmentNotification: UISegmentedControl = {
        let segment = CustomSegmentedControll(items: Segments.selectSegmets(.notification))
        return segment
    }()

    private lazy var segmentsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [segmentTemp,
                                                  segmentWind,
                                                  segmentTime,
                                                  segmentNotification])
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.spacing = 20
        stack.distribution = .fillProportionally
        return stack
    }()


    private lazy var setupSettingsButton: UIButton = {
        let button = CustomButton(title: "Установить",
                                  font: UIFont.rubikRegular16) {
            self.setupSettings()
        }
        return button
    }()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: .curveEaseOut) {
            self.cloudTop.frame.origin.x = self.view.frame.origin.x
            self.cloudMiddle.frame.origin.x = self.view.frame.width - self.cloudMiddle.frame.width
            self.cloudBottom.center.x = self.view.center.x
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorSet.colorSet(.blue)
        setupConstraints()
        saveSettings()

    }

    private func setupConstraints() {
        view.addSubviews(backgroundView, titleSetting, labelStackView, segmentsStackView, setupSettingsButton, cloudTop, cloudMiddle, cloudBottom)

        NSLayoutConstraint.activate([
            backgroundView.widthAnchor.constraint(equalToConstant: 320),
            backgroundView.heightAnchor.constraint(equalToConstant: 330),
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            titleSetting.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 27),
            titleSetting.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),

            labelStackView.topAnchor.constraint(equalTo: titleSetting.bottomAnchor, constant: 20),
            labelStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),

            segmentsStackView.centerYAnchor.constraint(equalTo: labelStackView.centerYAnchor),
            segmentsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),

            setupSettingsButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -16),
            setupSettingsButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 35),
            setupSettingsButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -35),
            setupSettingsButton.heightAnchor.constraint(equalToConstant: 40),

            cloudTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
            cloudTop.trailingAnchor.constraint(equalTo: view.leadingAnchor),

            cloudMiddle.topAnchor.constraint(equalTo: cloudTop.bottomAnchor, constant: 26),
            cloudMiddle.leadingAnchor.constraint(equalTo: view.trailingAnchor),

            cloudBottom.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 80),
            cloudBottom.trailingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    

    private func setupSettings() {
        let tempInd = segmentTemp.selectedSegmentIndex
        let temp = Segments.selectSegmets(.temperature)[tempInd]
        UserDefaults.standard.setValue(temp, forKey: SettingsKey.temperature.rawValue)

        let windInd = segmentWind.selectedSegmentIndex
        let wind = Segments.selectSegmets(.windSpeed)[windInd]
        UserDefaults.standard.setValue(wind, forKey: SettingsKey.windSpeed.rawValue)


        let timeInd = segmentTime.selectedSegmentIndex
        let time = Segments.selectSegmets(.timeFormat)[timeInd]
        UserDefaults.standard.setValue(time, forKey: SettingsKey.timeFormat.rawValue)

        // - push notification settings will be saved here
        self.dismiss(animated: false)
    }



    private func saveSettings() {
        let temperature = UserDefaults.standard.object(forKey: SettingsKey.temperature.rawValue) as? String ?? "C"
        if temperature == "C" {
            segmentTemp.selectedSegmentIndex = 0
        } else {
            segmentTemp.selectedSegmentIndex = 1
        }

        let wind = UserDefaults.standard.object(forKey: SettingsKey.windSpeed.rawValue) as? String ?? "Km"
        if wind == "Km" {
            segmentWind.selectedSegmentIndex = 1
        } else {
            segmentWind.selectedSegmentIndex = 0
        }

        let time = UserDefaults.standard.object(forKey: SettingsKey.timeFormat.rawValue) as? String ?? "24"
        if time == "24" {
            segmentTime.selectedSegmentIndex = 1
        } else {
            segmentTime.selectedSegmentIndex = 0
        }

        // In developing
        segmentNotification.selectedSegmentIndex = 1
        segmentNotification.isEnabled = false
    }


}
