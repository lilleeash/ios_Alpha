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
    
    func getAllBears(completion: @escaping (Result<BeersModel, Error>) -> Void) {
        guard let request = asURLRequest(path: "/beers") else {
            completion(.failure(APIError.invalidRequest))
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data, error == nil else {
                    completion(.failure(APIError.noData))
                    return
                }
                
                guard let responseLogin = try? JSONDecoder().decode(BeersModel.self, from: data) else {
                    completion(.failure(APIError.decodingError))
                    return
                }
                
                completion(.success(responseLogin))
            }
            .resume()
        }
    }
    
    private func asURLRequest(path: String, method: APIMethod = .get) -> URLRequest? {
        // guard let finalURL = URL(string: config.baseURL + path) else { return nil }
        guard let finalURL = URL(string: "https://api.punkapi.com/v2" + path) else { return nil }
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        return request
    }
}
