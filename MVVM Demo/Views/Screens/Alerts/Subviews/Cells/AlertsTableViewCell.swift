//
//  AlertsTableViewCell.swift
//  MVVM Demo
//
//  Created by Difeng Chen on 4/9/22.
//

import UIKit

class AlertsTableViewCell: UITableViewCell {

    // MARK: - Views

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    // MARK: - Properties

    static var reusableIdentifier: String {
        String(describing: type(of: self))
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setUpUI()
    }

    private func setUpUI() {
        addSubview(titleLabel)

        titleLabel.pin(to: self)

        selectionStyle = .none
    }

    func configure(with alert: Alert) {
        titleLabel.text = alert.title
    }
}
