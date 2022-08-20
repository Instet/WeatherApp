//
//  CustomButton.swift
//  WeatherApp
//
//  Created by Руслан Магомедов on 16.08.2022.
//

import UIKit

final class CustomButton: UIButton {

    private var buttonAction: (() -> Void)

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? ColorSet.colorSet(.orangeDark) : ColorSet.colorSet(.orange)
        }
    }

    init(title: String, font: UIFont, buttonAction: @escaping () -> Void ) {
        self.buttonAction = buttonAction
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = ColorSet.colorSet(.orange)
        self.tintColor = .blue
        self.titleLabel?.font = font
        self.layer.cornerRadius = 10
        self.addTarget(self, action: #selector(actionButton), for: .touchUpInside)

    }

    @objc private func actionButton() {
        buttonAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
