//
//  DetailController.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 02.03.2025.
//

import UIKit

class DetailController: UIViewController {
    let mainView = DetailView()
    var task = Task(
        title: "", detail: "", category: "", priorityImportant: false,
        priorityExpress: false)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(
                equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        mainView.closeControllerDelegate = self
        setupView()
    }

    private func setupView() {
        mainView.setProperties(task)
    }

}
extension DetailController: DetailViewCloseControllerDelegate {
    func closeController() {
        dismiss(animated: true)
    }
}
