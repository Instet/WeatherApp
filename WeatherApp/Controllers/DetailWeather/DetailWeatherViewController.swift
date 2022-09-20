//
//  DetailWeatherViewController.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 08.09.2022.
//

import UIKit

class DetailWeatherViewController: UIViewController {

    private var indentifire = String(describing: DatesForecastCell.self)
    var index: IndexPath
    var presenter = WeatherPresenter()
    


    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var cityLabel: UILabel = {
        let label = CustomLabel(text: "Moscow, Russia",
                                textColor: .black,
                                font: .rubikMedium18)
        return label
    }()

    private lazy var dailyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.register(DatesForecastCell.self, forCellWithReuseIdentifier: indentifire)
        return view
    }()

    private lazy var dayDetailView: DetailGeneralView = {
        let view = DetailGeneralView(isNight: false)
        view.title = "День"
        return view
    }()

    private lazy var nightDetailView: DetailGeneralView = {
        let view = DetailGeneralView(isNight: true)
        view.title = "Ночь"
        return view
    }()

    private lazy var havenView: DetailHavenView = {
        let view = DetailHavenView(frame: .zero)
        return view
    }()

    init(index: IndexPath) {
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavItems()
        setupLayout()
        presenter.networkService.dataDelegate = self
        presenter.getCurrentLocationWeather()

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

        contentView.addSubviews(cityLabel, dailyCollectionView, dayDetailView, nightDetailView, havenView)

        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cityLabel.heightAnchor.constraint(equalToConstant: 22),

            dailyCollectionView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 40),
            dailyCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dailyCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dailyCollectionView.heightAnchor.constraint(equalToConstant: 36),

            dayDetailView.topAnchor.constraint(equalTo: dailyCollectionView.bottomAnchor, constant: 40),
            dayDetailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dayDetailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dayDetailView.heightAnchor.constraint(equalToConstant: 344),

            nightDetailView.topAnchor.constraint(equalTo: dayDetailView.bottomAnchor, constant: 12),
            nightDetailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nightDetailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nightDetailView.heightAnchor.constraint(equalToConstant: 344),

            havenView.topAnchor.constraint(equalTo: nightDetailView.bottomAnchor),
            havenView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            havenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            havenView.heightAnchor.constraint(equalToConstant: 160),
            havenView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)

        ])
    }

    // пунктирные полосы









    private func setupNavItems() {
        let button: UIButton = {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
            button.tintColor = .black
            let label = UILabel()
            label.text = "Дневная погода"
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


// MARK: - UICollectionViewDelegateFlowLayout
extension DetailWeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 88
        let height: CGFloat = 36
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath

        // debug

    }


}

// MARK: - UICollectionViewDataSource
extension DetailWeatherViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(presenter.days.count)
        return presenter.days.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifire, for: indexPath) as? DatesForecastCell else { return UICollectionViewCell() }
        cell.day = presenter.days[indexPath.item]
        if indexPath.item == index.item {
            cell.colorBackgroundCell = ColorSet.colorSet(.blue)
            cell.textColor = .white
        }
        return cell
    }


}

extension DetailWeatherViewController: NetworkServiceDelegate {

    func fetchWeather(_ networking: NetworkService, _ modelWeather: Weather) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.presenter.days = self.presenter.getDailyFromWeather(from: modelWeather)
            self.dayDetailView.day = self.presenter.days[self.index.item]
            self.nightDetailView.day = self.presenter.days[self.index.item]
            self.havenView.timezoneOffset = modelWeather.timezoneOffset
            self.havenView.day = self.presenter.days[self.index.item]
            self.dailyCollectionView.reloadData()
        }
    }

    func fetchFailError(_ error: Error) {
        print(error.localizedDescription)
    }


}
