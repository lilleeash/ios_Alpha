//
//  Array+Subscript.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 30.10.2023.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        index < self.count ? self[index] : nil
    }
}
