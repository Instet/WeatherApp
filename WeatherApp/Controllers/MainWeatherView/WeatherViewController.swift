//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 21.08.2022.
//

import UIKit

class WeatherViewController: UIViewController, UIScrollViewDelegate {

    var coordinato: CoordinatorProtocol?

    // debug layout
    let array = [25, 35, 65, 75, 74, 43, 45, 34, 34, 56, 21]

    private lazy var generalWeatherView = GeneralWeatherView()

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.showsVerticalScrollIndicator = false
        scroll.isScrollEnabled = true
        return scroll
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private lazy var detailsFor24hoursButton: UIButton = {
        let button = UIButton()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.rubikRegular16,
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedText = NSMutableAttributedString(string: "Подробнее на 24 часа",
                                                       attributes: attributes)
        button.setAttributedTitle(attributedText, for: .normal)
        button.addTarget(self, action: #selector(detailsFor24hours), for: .touchUpInside)
        return button
    }()

    private lazy var forecastLabel: UILabel = {
        let label = CustomLabel(text: "Ежедневный прогноз", textColor: .black, font: UIFont.rubikMedium18)
        return label
    }()

    private lazy var collectionHourlyWeather: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(HourlyWeatherForecastCell.self,
                            forCellWithReuseIdentifier: String(describing: HourlyWeatherForecastCell.self))
        return collection
    }()

    private lazy var dailyWeatherTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DailyWeatherForecastCell.self,
                           forCellReuseIdentifier: String(describing: DailyWeatherForecastCell.self))
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }


    private func setupLayout() {

        view.addSubviews(scrollView)
        scrollView.addSubviews(contentView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),


            contentView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),
        ])
        contentView.addSubviews(generalWeatherView, detailsFor24hoursButton, collectionHourlyWeather,
                                forecastLabel, dailyWeatherTable)
        NSLayoutConstraint.activate([
            generalWeatherView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            generalWeatherView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            generalWeatherView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            generalWeatherView.heightAnchor.constraint(equalToConstant: 212),

            detailsFor24hoursButton.topAnchor.constraint(equalTo: generalWeatherView.bottomAnchor, constant: 33),
            detailsFor24hoursButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            collectionHourlyWeather.topAnchor.constraint(equalTo: detailsFor24hoursButton.bottomAnchor, constant: 24),
            collectionHourlyWeather.leadingAnchor.constraint(equalTo: generalWeatherView.leadingAnchor),
            collectionHourlyWeather.trailingAnchor.constraint(equalTo: generalWeatherView.trailingAnchor),
            collectionHourlyWeather.heightAnchor.constraint(equalToConstant: 84),

            forecastLabel.topAnchor.constraint(equalTo: collectionHourlyWeather.bottomAnchor, constant: 24),
            forecastLabel.leadingAnchor.constraint(equalTo: generalWeatherView.leadingAnchor),

            dailyWeatherTable.topAnchor.constraint(equalTo: forecastLabel.bottomAnchor, constant: 10),
            dailyWeatherTable.leadingAnchor.constraint(equalTo: generalWeatherView.leadingAnchor),
            dailyWeatherTable.trailingAnchor.constraint(equalTo: generalWeatherView.trailingAnchor),
            dailyWeatherTable.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2)

            ])
    }

    @objc private func detailsFor24hours() {
        print("detailsFor24hours")
    }
    
}




// MARK: - UICollectionViewDataSource
extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HourlyWeatherForecastCell.self), for: indexPath) as? HourlyWeatherForecastCell

        guard let cell = cell else { return UICollectionViewCell() }
        // debug
        cell.array(string: String(array[indexPath.row]))
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 42
        let height: CGFloat = 84
        return CGSize(width: width, height: height)
    }

}




// MARK: - UITableViewDelegate
extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }

}

//MARK: - UITableViewDataSource
extension WeatherViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DailyWeatherForecastCell.self), for: indexPath) as? DailyWeatherForecastCell
        guard let cell = cell else { return UITableViewCell() }
        cell.array(string: String(array[indexPath.row]))
        return cell
    }


}