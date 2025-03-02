//
//  UIImageView+Ext.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

extension UIImageView {
    convenience init(
        image: UIImage?, color: UIColor, contentMode: UIView.ContentMode
    ) {
        self.init(image: image)
        self.contentMode = contentMode
        tintColor = color
    }
}
