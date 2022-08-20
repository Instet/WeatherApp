//
//  CustomLabel.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 16.08.2022.
//

import UIKit

final class CustomLabel: UILabel {

    init(text: String, textColor: UIColor, font: UIFont) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = textColor
        self.font = font
        self.backgroundColor = .clear
        self.contentMode = .left
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.adjustsFontSizeToFitWidth = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
