//
//  Networking.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 16.10.2023.
//

import Foundation

protocol NetworkingServiceProtocol {
    func fetchBeers() async throws -> BeersModel
}

final class NetworkingService {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    private let config: Config
    
    init() {
        self.config = Config()
        self.decoder = JSONDecoder()
        self.session = URLSession.shared
    }
}

extension NetworkingService: NetworkingServiceProtocol {
    func fetchBeers() async throws -> BeersModel {
        guard let request = asURLRequest(path: "/beers") else {
            throw APIError.invalidRequest
        }
        
        let (data, response) = try await session.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
            throw self.httpError(httpResponse.statusCode)
        }
        
        let fetchedData = try JSONDecoder().decode(BeersModel.self, from: data)
        return fetchedData
    }
}

private extension NetworkingService {
    private func asURLRequest(path: String, method: APIMethod = .get) -> URLRequest? {
        guard let finalURL = URL(string: "https://api.punkapi.com/v2" + path) else { return nil }
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        return request
    }
    
    private func httpError(_ statusCode: Int) -> APIError {
        switch statusCode {
        case 404: return .notFound
        case 401: return .unauthorized
        case 403: return .forbidden
        case 500: return .serverError
        case 501...599: return .error5xx(statusCode)
        default:
            return .unknownError
        }
    }
}
