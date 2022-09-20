//
//  MainScreenViewController.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 22.08.2022.
//

import UIKit

class MainScreenViewController: UIPageViewController, MainViewProtocol {

    var presenter: MainViewPresenterProtocol?
    var page: [UIViewController] = []

    
    private lazy var pageControll: UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = 1
        page.pageIndicatorTintColor = .lightGray
        page.currentPageIndicatorTintColor = .black
        return page
    }()

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setupView()
    
        // debug
        let weather = WeatherViewController(coordinator: presenter?.coordinator)
        setViewControllers([weather], direction: .forward, animated: true, completion: nil)
    }

    private func setupView() {
        view.backgroundColor = .white
        let settingButton = UIBarButtonItem(image: UIImage(named: ImageSet.settings.rawValue),
                                            style: .plain,
                                            target: self,
                                            action: #selector(goToSetting))

        let addCityButton = UIBarButtonItem(image: UIImage(named: ImageSet.geo.rawValue),
                                            style: .plain,
                                            target: self,
                                            action: #selector(addCityAction))
        navigationItem.leftBarButtonItem = settingButton
        navigationItem.rightBarButtonItem = addCityButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
        view.addSubviews(pageControll)
        NSLayoutConstraint.activate([
            pageControll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageControll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pageControll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])

    }

    @objc private func goToSetting() {
        presenter?.coordinator?.goToSetting()

    }

    @objc private func addCityAction() {
        print("addCityAction")
    }



}

// MARK: - UIPageViewControllerDelegate
extension MainScreenViewController: UIPageViewControllerDelegate {

}

// MARK: - UIPageViewControllerDataSource
extension MainScreenViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }


}
