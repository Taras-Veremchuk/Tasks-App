//
//  DetailView.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

protocol DetailViewCloseControllerDelegate: AnyObject {
    func closeController()
}

class DetailView: UIView {
    weak var delegate: TasksDelegate?
    weak var closeControllerDelegate: DetailViewCloseControllerDelegate?
    private let colorCircle = UIImageView()
    private let deleteBtn = UIButton()
    private let taskTitle = UILabel(title: "Назва:", fontSize: 22)
    private let taskDescr = UILabel(title: "Опис:", fontSize: 22)
    private let taskCategory = UILabel(title: "Категорія:", fontSize: 22)
    let titleLabel = UILabel(title: "", fontSize: 22)
    var priorityImportant: Bool = false
    var priorityExpress: Bool = false
    let detail = UILabel(title: "", fontSize: 22)
    let category = UILabel(title: "", fontSize: 22)
    var id = ""

    init() {
        super.init(frame: .zero)
        deleteBtn.setBackgroundImage(UIImage(systemName: "trash"), for: .normal)
        deleteBtn.tintColor = .systemRed
        setConstraints()
        configureDeleteBtn()
        setViews()
    }
    private func setViews() {
        backgroundColor = .white
        colorCircle.layer.cornerRadius = 16
        colorCircle.layer.borderWidth = 1
        colorCircle.clipsToBounds = true
    }

    func setProperties(_ task: Task) {
        titleLabel.text = task.title
        detail.text = task.detail
        category.text = task.category
        priorityImportant = task.priorityImportant
        priorityExpress = task.priorityExpress
        id = task.id
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
        closeControllerDelegate?.closeController()
    }

    private func setConstraints() {
        let titleStack = UIStackView(
            views: [colorCircle, titleLabel], axis: .horizontal, spacing: 20,
            aligment: .fill)
        let detailStack = UIStackView(
            views: [taskDescr, detail], axis: .horizontal, spacing: 20,
            aligment: .fill)
        let categoryStack = UIStackView(
            views: [taskCategory, category], axis: .horizontal, spacing: 20,
            aligment: .firstBaseline)

        let stack = UIStackView(
            views: [titleStack, detailStack, categoryStack], axis: .vertical,
            spacing: 20, aligment: .fill)
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])

        NSLayoutConstraint.activate([
            colorCircle.widthAnchor.constraint(equalToConstant: 32),
            colorCircle.heightAnchor.constraint(
                equalTo: colorCircle.widthAnchor),
        ])

        addSubview(deleteBtn)
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            deleteBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            deleteBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteBtn.widthAnchor.constraint(equalToConstant: 40),
            deleteBtn.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
