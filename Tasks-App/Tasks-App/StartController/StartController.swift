//
//  ViewController.swift
//  Tasks-App
//
//  Created by Taras Veremchuk on 25.02.2025.
//

import UIKit

class StartController: UIViewController {
    let mainView = StartView()

    var tasks: [Task] = [
        .init(
            title: "Cook dinner", detail: "with apple", category: "eat",
            priorityImportant: true, priorityExpress: false),
        .init(
            title: "Go to shop", detail: "Kaufland", category: "shop",
            priorityImportant: true, priorityExpress: true),
        .init(
            title: "Full a car", detail: "Orlen", category: "car",
            priorityImportant: false, priorityExpress: true),
    ]
    {
        didSet {
            mainView.tableView.reloadData()
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

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
        configureItems()
    }

    private func configureItems() {
        navigationController?.navigationBar.tintColor = .white

        let imagePlus = UIImage(systemName: "plus.circle")
        let imageBurger = UIImage(systemName: "line.horizontal.3.circle")

        let title = UILabel(
            title: "Tasks App", textColor: .white, fontSize: 32, isBold: true)
        let burgerBtn = UIButton(
            iconImage: imageBurger, iconSize: CGSize(width: 40, height: 40))
        let plusBtn = UIButton(
            iconImage: imagePlus, iconSize: CGSize(width: 40, height: 40))

        navigationItem.titleView = title
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            customView: burgerBtn)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: plusBtn)

        plusBtn.addTarget(
            self, action: #selector(addNewTask), for: .touchUpInside)
        burgerBtn.addTarget(
            self, action: #selector(openBurgerMenu), for: .touchUpInside)

        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }

    @objc
    func openBurgerMenu() {
        print("Burger Menu")
    }
    @objc
    func addNewTask() {
        let vc = TasksController()
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StartController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TaskCell.reuseID) as? TaskCell
        else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        if !tasks.isEmpty {
            cell.setupCell(task: tasks[indexPath.row])
        }
        cell.delegate = self
        return cell
    }

    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
        let vc = DetailController()
        vc.task = tasks[indexPath.item]
        vc.mainView.delegate = self
        self.present(vc, animated: true)
    }

    func tableView(
        _ tableView: UITableView, heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        66
    }
}

extension StartController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let zakrep = UIContextualAction(style: .normal, title: "Fix") {
            _, _, _ in
            print("Fix task")
        }
        zakrep.backgroundColor = .green

        let config = UISwipeActionsConfiguration(actions: [zakrep])

        return config
    }

    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .destructive, title: "Delete"
        ) { _, _, _ in
            self.tasks.remove(at: indexPath.row)
        }

        let editAction = UIContextualAction(style: .normal, title: "Edit") {
            _, _, _ in
            print("Edit Task")
        }

        let config = UISwipeActionsConfiguration(actions: [
            deleteAction, editAction,
        ])
        return config
    }
}

extension StartController: TasksControllerDelegate {
    func addTask(task: Task) {
        self.tasks.insert(task, at: 0)
    }
}

extension StartController: TasksDelegate {
    func remoweTask(taskId: String) {
        let index = self.tasks.firstIndex { $0.id == taskId }
        if let index {
            self.tasks.remove(at: index)
        }
    }
}
