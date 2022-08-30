//
//  EmptyViewConrtoller.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 22.08.2022.
//

import Foundation
import UIKit

class EmptyViewConrtoller: UIViewController {

    private lazy var labelPlus: UILabel = {
        let label = UILabel()
        label.text = "➕"
        label.tintColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 100, weight: .regular)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubviews(labelPlus)
        NSLayoutConstraint.activate([
            labelPlus.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelPlus.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }
}
