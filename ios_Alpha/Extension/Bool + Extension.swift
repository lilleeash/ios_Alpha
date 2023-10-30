//
//  Bool + Extension.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 16.10.2023.
//

import Foundation

extension Bool {
    init(string: String) {
        self.init(NSString(string: string).boolValue)
    }
}
