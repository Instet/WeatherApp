//
//  OnBoardingViewController.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 20.08.2022.
//

import UIKit
import CoreLocation


class OnBoardingViewController: UIViewController {

    var coordinator: AppCoordinator? 
    var presenter: OnBoardingPresenterProtocol?


    private let defaults = UserDefaults.standard

    // MARK: доработать согласно макету

    private var onBordingImage = UIImageView.getImage(ImageSet.onBoarding.rawValue)

    private lazy var titleLabelTop: UILabel = {
        let label = UILabel()
        label.font = UIFont.rubikBold16
        label.text = "Разрешить приложению  Weather использовать данные \nо местоположении вашего устройства"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private lazy var titleLabelMiddle: UILabel = {
        let label = UILabel()
        label.font = UIFont.rubikRegular14
        label.text = "Чтобы получить более точные прогнозы \nпогоды во время движения или путешествия"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var titleLabelBottom: UILabel = {
        let label = UILabel()
        label.font = UIFont.rubikRegular14
        label.text = "Вы можете изменить свой выбор в любое \nвремя из меню приложения"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var onGeoButton: UIButton = {
        let button = CustomButton(title: "ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ  УСТРОЙСТВА",
                                  font: UIFont.rubikMedium12) {
            self.useLocation()

        }
        return button
    }()

    private lazy var cancelGeoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.textAlignment = .right
        button.tintColor = .white
        button.setTitle("НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", for: .normal)
        button.titleLabel?.font = UIFont.rubikRegular16
        button.addTarget(self, action: #selector(cancelButton), for: .touchUpInside)
        return button
    }()

    init(presenter: OnBoardingPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()


    }

    private func setupConstraints() {
        view.backgroundColor = ColorSet.colorSet(.blue)

        view.addSubviews(onBordingImage, titleLabelTop, titleLabelMiddle, titleLabelBottom,
                        onGeoButton, cancelGeoButton)

        NSLayoutConstraint.activate([

            onBordingImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
            onBordingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            titleLabelTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            titleLabelTop.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            titleLabelTop.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),

            titleLabelMiddle.topAnchor.constraint(equalTo: titleLabelTop.bottomAnchor, constant: 56),
            titleLabelMiddle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabelMiddle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            titleLabelBottom.topAnchor.constraint(equalTo: titleLabelMiddle.bottomAnchor, constant: 14),
            titleLabelBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabelBottom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            onGeoButton.topAnchor.constraint(equalTo: titleLabelBottom.bottomAnchor, constant: 44),
            onGeoButton.widthAnchor.constraint(equalToConstant: 340),
            onGeoButton.heightAnchor.constraint(equalToConstant: 40),
            onGeoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            cancelGeoButton.topAnchor.constraint(equalTo: onGeoButton.bottomAnchor, constant: 25),
            cancelGeoButton.trailingAnchor.constraint(equalTo: onGeoButton.trailingAnchor)

        ])
    }


    @objc private func cancelButton() {

    }

    func useLocation() {
        presenter?.requestLocation(completion: { 
            self.coordinator?.startApp()
        })
    }


}


