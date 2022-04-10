//
//  ListHeaderView.swift
//  MVVM Demo
//
//  Created by Difeng Chen on 4/9/22.
//

import UIKit

protocol AlertsHeaderViewDelegate: AnyObject {

    // MARK: - Functions

    func addAlert()
    func deleteAlert()
}

class AlertsHeaderStackView: UIStackView {

    // MARK: - Views

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alerts"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.addAction(UIAction(handler: { _ in
            self.delegate?.addAlert()
        }), for: .touchUpInside)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete", for: .normal)
        button.addAction(UIAction(handler: { _ in
            self.delegate?.deleteAlert()
        }), for: .touchUpInside)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    // MARK: - Properties

    weak var delegate: AlertsHeaderViewDelegate?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpUI()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)

        setUpUI()
    }

    // MARK: - Functions

    func setUpUI() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(addButton)
        addArrangedSubview(deleteButton)

        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        distribution = .fillEqually
        alignment = .center
    }
}
