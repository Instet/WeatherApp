//
//  HourlyWeatherViewController.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 20.09.2022.
//

import UIKit


class HourlyWeatherViewController: UIViewController, UIScrollViewDelegate {


    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private lazy var titleCityLabel: UILabel = {
        let label = CustomLabel(text: "City name", textColor: .black, font: .rubikMedium18)
        return label
    }()



    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavItems()
        setupLayout()

    }

    private func setupLayout() {
        view.addSubviews(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        scrollView.addSubviews(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        contentView.addSubviews(titleCityLabel)

        NSLayoutConstraint.activate([
            titleCityLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleCityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    
    }


    private func setupNavItems() {
        let button: UIButton = {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
            button.tintColor = .black
            let label = UILabel()
            label.text = "Прогноз на 24 часа"
            label.font = UIFont.rubikRegular16
            label.textColor = .lightGray
            button.addSubviews(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 20)
            ])
            button.addTarget(self, action: #selector(buttonActiom), for: .touchUpInside)
            return button
        }()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }


    @objc func buttonActiom() {
        print("back to WeatherVC")
        // add coordinator
        navigationController?.popViewController(animated: true)
    }


    


}
