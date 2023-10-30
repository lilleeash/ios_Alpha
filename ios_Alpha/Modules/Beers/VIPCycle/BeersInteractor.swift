//
//  BeersInteractor.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import Foundation

protocol BeersBussinessLogic {
    func requestData() async throws
    var presenter: BeersPresentationLogic? { get set }
}

class BeersInteractor: BeersBussinessLogic {
    private let networkService: NetworkingServiceProtocol = NetworkingService()
    
    var presenter: BeersPresentationLogic?
    
    func requestData() async throws {
        do {
            let fetchedBeers = try await networkService.fetchBeers()
            self.presenter?.presentData(data: fetchedBeers)
        } catch {
            print(error.localizedDescription)
        }
    }
}
