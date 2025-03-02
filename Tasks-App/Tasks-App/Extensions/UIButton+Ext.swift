//
//  UIButton+Ext.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

extension UIButton {
    convenience init(title: String?, bgColor: UIColor) {
        self.init(type: .system)
        let height: CGFloat = 60
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = bgColor
        setTitle(title, for: .normal)
        tintColor = .white
        heightAnchor.constraint(equalToConstant: height).isActive = true
        titleLabel?.font = .systemFont(ofSize: 22)
    }

    convenience init(
        iconImage: UIImage?, iconSize: CGSize = CGSize(width: 24, height: 24)
    ) {
        self.init(type: .system)
        self.tintColor = .white

        let icon = UIImageView(image: iconImage)
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false

        addSubview(icon)
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: iconSize.width),
            icon.heightAnchor.constraint(equalToConstant: iconSize.height),
        ])
    }
}
