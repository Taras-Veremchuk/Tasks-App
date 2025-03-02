//
//  SectionFooter.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

class SectionFooter: UIView {
    let titleLabel = UILabel(
        title: "Назва категоріі", textColor: .black, fontSize: 16, isBold: true)
    let costLabel = UILabel(
        title: "4000 $", textColor: .black, fontSize: 16, isBold: true)

    init() {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }

    private func setViews() {
        costLabel.textAlignment = .right
    }

    private func setConstraints() {
        let stack = UIStackView(
            views: [titleLabel, costLabel], axis: .horizontal, spacing: 8,
            aligment: .fill)

        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
