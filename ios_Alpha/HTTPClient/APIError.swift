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
    case notFound
    case unauthorized
    case serverError
    case forbidden
    case unknownError
    case error5xx(_ statusCode: Int)
}
