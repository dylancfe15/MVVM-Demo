//
//  AlertsTableView.swift
//  MVVM Demo
//
//  Created by Difeng Chen on 4/9/22.
//

import UIKit

class AlertsTableView: UITableView {

    // MARK: - Properties

    private(set) lazy var alertsViewModel = AlertsViewModel {
        self.reloadData()
    }

    // MARK: - Initializers

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        setUpUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setUpUI()
    }

    // MARK: - Functions

    private func setUpUI() {
        register(AlertsTableViewCell.self, forCellReuseIdentifier: AlertsTableViewCell.reusableIdentifier)

        delegate = self
        dataSource = self

        separatorStyle = .singleLine
    }
}

// MARK: - AlertsTableView+UITableViewDataSource

extension AlertsTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alertsViewModel.alerts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlertsTableViewCell.reusableIdentifier, for: indexPath) as? AlertsTableViewCell else {
            return UITableViewCell()
        }

        let alert = alertsViewModel.alerts[indexPath.row]

        cell.configure(with: alert)

        return cell
    }
}

// MARK: - AlertsTableView+UITableViewDelegate

extension AlertsTableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
