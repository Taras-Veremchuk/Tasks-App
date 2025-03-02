//
//  TasksController.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

protocol TasksControllerDelegate: AnyObject {
    func addTask(task: Task)
}

class TasksController: UIViewController {
    let mainView = TasksView()
    weak var delegate: TasksControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        addTapToDismissKeyboard()
        setActions()
    }

    private func setActions() {
        let startAction = UIAction { [weak self] _ in
            guard let self else { return }
            guard
                let title = self.mainView.titleTF.text?.trimmingCharacters(
                    in: .whitespaces),
                let detail = self.mainView.detailsTF.text?.trimmingCharacters(
                    in: .whitespaces),
                let category = self.mainView.categoryTF.text?
                    .trimmingCharacters(in: .whitespaces),
                !title.isEmpty, !detail.isEmpty, !category.isEmpty
            else {
                self.showAlert("Не існує одного або декількох значень")
                return
            }
            guard title.count > 2 else {
                self.showAlert("Назва має бути довша - мінімум 2 символи!")
                return
            }

            let chooseImportan = self.mainView.chooseImportantElement.isOn
            let chooseExpress = self.mainView.chooseExpressElement.isOn

            let task = Task(
                title: title, detail: detail, category: category,
                priorityImportant: chooseImportan,
                priorityExpress: chooseExpress)
            delegate?.addTask(task: task)

            navigationController?.popViewController(animated: true)
        }
        mainView.saveButton.addAction(startAction, for: .touchUpInside)
    }
}
