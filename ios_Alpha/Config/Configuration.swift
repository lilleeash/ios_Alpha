//
//  Configuration.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 16.10.2023.
//

import Foundation

final class Config {
    private enum Keys {
        static let baseURL = "BASE_URL"
        static let debugLogger = "DEBUG_LOGGER"
    }

    let isDebugLogger: Bool = {
        guard let value = Bundle.main
            .object(forInfoDictionaryKey: Keys.debugLogger) as? String
        else {
            fatalError("Invalid value or undefined key")
        }
        return Bool(string: value)
    }()

    let baseURL: String = {
        guard let value = Bundle.main.object(forInfoDictionaryKey: Keys.baseURL) as? String else {
            fatalError("Invalid value or undefined key")
        }

        return value
    }()
}
