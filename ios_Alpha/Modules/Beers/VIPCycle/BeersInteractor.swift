//
//  BeersInteractor.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import Foundation

protocol BeersBussinessLogic {
    func requestData()
    var presenter: BeersPresentationLogic? { get set }
}

class BeersInteractor: BeersBussinessLogic {
    
    private let networkService = NetworkingService()
    
    var presenter: BeersPresentationLogic?
    
    func requestData() {
        networkService.getAllBears { [weak self] result in
            switch result {
            case .success(let success):
                self?.presenter?.presentData(data: success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
