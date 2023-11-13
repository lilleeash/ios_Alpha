//
//  BeersInteractor.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import Foundation

protocol BeersBussinessLogic {
    func requestData() async throws
}

class BeersInteractor: BeersBussinessLogic {
    
    private let presenter: BeersPresentationLogic
    private let networkService: NetworkingServiceProtocol
    
    init(presenter: BeersPresentationLogic, networkService: NetworkingServiceProtocol = NetworkingService()) {
        self.presenter = presenter
        self.networkService = networkService
    }
    
    func requestData() async throws {
        do {
            let fetchedBeers = try await networkService.fetchBeers()
            DispatchQueue.main.async {
                self.presenter.presentData(data: fetchedBeers)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
