//
//  UIView+Extensions.swift
//  MVVM Demo
//
//  Created by Difeng Chen on 4/9/22.
//

import UIKit

extension UIView {

    /// Pin to all the edges of the given view
    /// - Parameter view: A given view to be pinned
    func pin(to view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
