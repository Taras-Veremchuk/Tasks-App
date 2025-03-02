//
//  TasksView.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

final class TasksView: UIView {

    private let titleLabel = UILabel(
        title: "Нова задача", textColor: .white, fontSize: 30)
    let titleTF = UITextField(placeholder: "Назва")
    let detailsTF = UITextField(placeholder: "Опис")
    let categoryTF = UITextField(placeholder: "Категорія")
    private let chooseImportantLabel = UILabel(
        title: "Важлива?", textColor: .black, fontSize: 22)
    private let chooseExpressLabel = UILabel(
        title: "Термінова?", textColor: .black, fontSize: 22)
    let chooseImportantElement = UISwitch()
    let chooseExpressElement = UISwitch()
    let saveButton = UIButton(title: "Зберегти", bgColor: .buttonBG)
    private var stack = UIStackView()

    init() {
        super.init(frame: .zero)
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        backgroundColor = .viewBG

        let descriptionStack = UIStackView(
            views: [titleTF, detailsTF, categoryTF],
            axis: .vertical,
            spacing: 10,
            aligment: .fill)
        descriptionStack.distribution = .fill

        let firstSwitchStack = UIStackView(
            views: [chooseImportantLabel, chooseImportantElement],
            axis: .horizontal,
            spacing: 0,
            aligment: .fill)
        firstSwitchStack.distribution = .fill

        let secondSwitchStack = UIStackView(
            views: [chooseExpressLabel, chooseExpressElement],
            axis: .horizontal,
            spacing: 0,
            aligment: .fill)
        secondSwitchStack.distribution = .fill

        let switchStack = UIStackView(
            views: [firstSwitchStack, secondSwitchStack],
            axis: .vertical,
            spacing: 10,
            aligment: .fill)
        switchStack.distribution = .fill

        stack = UIStackView(
            views: [descriptionStack, switchStack, saveButton],
            axis: .vertical,
            spacing: 34,
            aligment: .fill)
        stack.distribution = .fill
    }

    private func setConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])

        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor, constant: 50),
            stack.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 30),
            stack.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -30),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
