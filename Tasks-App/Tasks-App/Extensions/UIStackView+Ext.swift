//
//  UIStackView+Ext.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

extension UIStackView {
    convenience init(
        views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat,
        aligment: Alignment, bgColor: UIColor = .clear, radius: CGFloat = 0
    ) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
        self.alignment = aligment
        self.backgroundColor = bgColor
        self.layer.cornerRadius = radius
    }
}
