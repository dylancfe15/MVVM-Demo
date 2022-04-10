//
//  ListItemsViewModel.swift
//  MVVM Demo
//
//  Created by Difeng Chen on 4/9/22.
//

import Foundation

class AlertsViewModel {

    // MARK: - Properties

    private(set) var alerts: [Alert] = [] {
        didSet {
            alertsDidChangeCompletion()
        }
    }

    private let alertsDidChangeCompletion: () -> Void

    // MARK: - Initializers

    init(alertsDidChangeCompletion: @escaping () -> Void) {
        self.alertsDidChangeCompletion = alertsDidChangeCompletion
    }

    // MARK: - Functions

    func addAlert() {
        alerts.append(Alert(title: "\(alerts.count + 1)"))
    }

    func deleteAlert() {
        if !alerts.isEmpty {
            alerts.removeLast()
        }
    }
}
