//
//  NSLayoutConstraints.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 30.10.2023.
//

import UIKit

extension NSLayoutConstraint {
    static func autoresizingMask(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach {
            ($0.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
            $0.isActive = true
        }
    }
}
