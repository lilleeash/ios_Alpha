//
//  BeersPresenter.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import Foundation

protocol BeersPresentationLogic {
    func presentData(data: BeersModel)
}

class BeersPresenter: BeersPresentationLogic {
    
    var displayViewController: BeersDisplayLogic?
    
    func presentData(data: BeersModel) {
        let result = data
//        self.displayViewController?.resultData(data: result)
        self.displayViewController?.contentView.configure(with: result)
    }
}
