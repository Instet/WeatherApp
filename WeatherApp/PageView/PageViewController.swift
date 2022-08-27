//
//  PageViewController.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 22.08.2022.
//

import UIKit

class PageViewController: UIPageViewController {

    var presenter: PageViewPresenterProtocol!
    var coordinato: CoordinatorProtocol?

    private lazy var pageControll: UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 1
        page.numberOfPages = 1
        page.pageIndicatorTintColor = .lightGray
        page.currentPageIndicatorTintColor = .black
        return page
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setupView()

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
        print("goToSetting")
    }

    @objc private func addCityAction() {
        print("addCityAction")
    }

}

// MARK: - UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDelegate {

}

// MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }


}
