//
//  StartView.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

final class StartView: UIView {
    private let importantUrgentLabel = UILabel(
        title: "Важливе термінове",
        textColor: .black,
        fontSize: 22, lines: 2, isBold: true)
    private let importantLabel = UILabel(
        title: "Важливе не термінове",
        textColor: .black,
        fontSize: 22, lines: 2, isBold: true)
    private let noMetterUrgentLabel = UILabel(
        title: "Не важливе термінове",
        textColor: .black,
        fontSize: 22, lines: 2, isBold: true)
    private let noMetterLabel = UILabel(
        title: "Не важливе не термінове",
        textColor: .black,
        fontSize: 22, lines: 2, isBold: true)
    let tableView = UITableView()
    private let rabbitIcon = UIImageView(
        image: UIImage(systemName: "hare.fill"),
        color: .black,
        contentMode: .scaleAspectFill)
    private let turtleIcon = UIImageView(
        image: UIImage(systemName: "tortoise.fill"),
        color: .black,
        contentMode: .scaleAspectFill)
    private let timeIcon = UIImageView(
        image: UIImage(systemName: "timer.circle.fill"),
        color: .black,
        contentMode: .scaleAspectFill)
    private let boxIcon = UIImageView(
        image: UIImage(systemName: "shippingbox.fill"),
        color: .black,
        contentMode: .scaleAspectFill)

    init() {
        super.init(frame: .zero)
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        backgroundColor = .viewBG
        tableView.register(
            TaskCell.self, forCellReuseIdentifier: TaskCell.reuseID)
        tableView.backgroundColor = .clear
        addSubview(tableView)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        importantUrgentLabel.textAlignment = .center
        importantLabel.textAlignment = .center
        noMetterLabel.textAlignment = .center
        noMetterUrgentLabel.textAlignment = .center
    }

    private func setConstraints() {
        let importanUrgenttStack = UIStackView(
            views: [rabbitIcon, importantUrgentLabel],
            axis: .vertical,
            spacing: 8,
            aligment: .center,
            bgColor: .bgRabbit,
            radius: 20)

        let importantStack = UIStackView(
            views: [turtleIcon, importantLabel],
            axis: .vertical,
            spacing: 8,
            aligment: .center,
            bgColor: .bgTurtle,
            radius: 20)

        let topStack = UIStackView(
            views: [importanUrgenttStack, importantStack], axis: .horizontal,
            spacing: 15, aligment: .fill)

        let noMetterUrgentStack = UIStackView(
            views: [timeIcon, noMetterUrgentLabel],
            axis: .vertical,
            spacing: 8,
            aligment: .center,
            bgColor: .bgTime,
            radius: 20)

        let noMetterStack = UIStackView(
            views: [boxIcon, noMetterLabel],
            axis: .vertical,
            spacing: 8,
            aligment: .center,
            bgColor: .bgBox,
            radius: 20)

        let bottomStack = UIStackView(
            views: [noMetterUrgentStack, noMetterStack], axis: .horizontal,
            spacing: 15, aligment: .fill)

        let categoryStack = UIStackView(
            views: [topStack, bottomStack],
            axis: .vertical,
            spacing: 15,
            aligment: .fill)

        let stack = UIStackView(
            views: [categoryStack, tableView],
            axis: .vertical,
            spacing: 16,
            aligment: .fill)

        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: stack.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: stack.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: stack.rightAnchor),
            tableView.topAnchor.constraint(
                equalTo: categoryStack.bottomAnchor, constant: 16),
        ])

        NSLayoutConstraint.activate([
            turtleIcon.widthAnchor.constraint(equalToConstant: 80),
            turtleIcon.heightAnchor.constraint(equalToConstant: 80),
            boxIcon.widthAnchor.constraint(equalToConstant: 80),
            boxIcon.heightAnchor.constraint(equalToConstant: 80),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
