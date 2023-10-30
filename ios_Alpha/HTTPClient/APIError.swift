//
//  APIError.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import Foundation

enum APIError: Error {
    case invalidRequest
    case decodingError
    case noData
}
