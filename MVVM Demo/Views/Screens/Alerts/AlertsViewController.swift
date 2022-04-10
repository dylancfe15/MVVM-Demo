//
//  ListViewController.swift
//  MVVM Demo
//
//  Created by Difeng Chen on 4/9/22.
//

import UIKit

class AlertsViewController: UIViewController {

    // MARK: - Views

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerStackView, alertsTableView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var headerStackView: AlertsHeaderStackView = {
        let stackView = AlertsHeaderStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var alertsTableView: AlertsTableView = {
        let tableView = AlertsTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        headerStackView.delegate = self
    }
}

// MARK: - AlertsViewController+AlertsHeaderViewDelegate

extension AlertsViewController: AlertsHeaderViewDelegate {

    // MARK: - Functions

    func addAlert() {
        alertsTableView.alertsViewModel.addAlert()
    }

    func deleteAlert() {
        alertsTableView.alertsViewModel.deleteAlert()
    }
}
