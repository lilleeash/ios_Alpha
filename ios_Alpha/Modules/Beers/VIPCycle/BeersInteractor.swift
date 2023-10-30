//
//  BeersInteractor.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import Foundation

protocol ViewControllerBussinessLogic {
    func requestData()
    var presenter: ViewControllerPresentationLogic? { get set }
}

class BeersInteractor: ViewControllerBussinessLogic {
    
    private let networkService = NetworkingService()
    
    var presenter: ViewControllerPresentationLogic?
    
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
