//
//  CustomSegmentedControll.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 19.08.2022.
//

import UIKit

final class CustomSegmentedControll: UISegmentedControl {

    init(items: [String]) {
        super.init(items: items)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.selectedSegmentTintColor = ColorSet.colorSet(.blue)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .selected)
        self.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.rubikRegular16 as Any], for: .normal)
        self.setWidth(40, forSegmentAt: 0)
        self.setWidth(40, forSegmentAt: 1)
        self.backgroundColor = ColorSet.colorSet(.beige)
        self.layer.cornerRadius = 5

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
