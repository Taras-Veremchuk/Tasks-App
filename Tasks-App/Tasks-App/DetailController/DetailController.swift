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
        view = mainView
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
