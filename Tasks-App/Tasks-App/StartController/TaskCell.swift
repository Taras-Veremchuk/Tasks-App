//
//  ProductCell.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

protocol TasksDelegate: AnyObject {
    func remoweTask(taskId: String)
}

final class TaskCell: UITableViewCell {
    static let reuseID = "TaskCell"

    weak var delegate: TasksDelegate?
    private let containerView = UIView()
    private let colorCircle = UIImageView()
    private let titleLabel = UILabel(title: "", fontSize: 22)
    private var priorityImportant: Bool = false
    private var priorityExpress: Bool = false
    private let deleteBtn = UIButton()
    private var id = ""

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        deleteBtn.setBackgroundImage(UIImage(systemName: "trash"), for: .normal)
        deleteBtn.tintColor = .systemRed
        setConstraints()
        setViews()
        configureDeleteBtn()
    }

    func setupCell(task: Task) {
        self.id = task.id
        titleLabel.text = task.title
        priorityImportant = task.priorityImportant
        priorityExpress = task.priorityExpress
        if priorityImportant && !priorityExpress {
            colorCircle.backgroundColor = .bgTurtle
        } else if priorityExpress && !priorityImportant {
            colorCircle.backgroundColor = .bgTime
        } else if priorityImportant && priorityExpress {
            colorCircle.backgroundColor = .bgRabbit
        } else {
            colorCircle.backgroundColor = .bgBox
        }
    }

    private func configureDeleteBtn() {
        deleteBtn.addTarget(
            self, action: #selector(onDelete), for: .touchUpInside)
    }

    @objc
    func onDelete() {
        delegate?.remoweTask(taskId: id)
    }

    private func setViews() {
        backgroundColor = .clear
        colorCircle.layer.cornerRadius = 16
        colorCircle.clipsToBounds = true
        deleteBtn.backgroundColor = .clear

        containerView.backgroundColor = .white
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.borderC.cgColor
        containerView.layer.cornerRadius = 33
        containerView.clipsToBounds = true
    }

    private func setConstraints() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        containerView.addSubview(colorCircle)
        colorCircle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            colorCircle.centerYAnchor.constraint(equalTo: centerYAnchor),
            colorCircle.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 10),
            colorCircle.widthAnchor.constraint(equalToConstant: 32),
            colorCircle.heightAnchor.constraint(
                equalTo: colorCircle.widthAnchor),
        ])

        containerView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: colorCircle.trailingAnchor, constant: 16),
        ])

        contentView.addSubview(deleteBtn)
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            deleteBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            deleteBtn.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -20),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
