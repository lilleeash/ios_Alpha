//
//  BeersPresenter.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import Foundation

protocol BeersPresentationLogic {
    func presentData(data: BeersDataFlow.PresentModuleData.Responce)
}

class BeersPresenter: BeersPresentationLogic {
    
    weak var viewController: BeersDisplayLogic?
    
    func presentData(data: BeersDataFlow.PresentModuleData.Responce) {
        let viewModel = data.map {
            BeerViewModel(title: $0.name, tagline: $0.tagline)
        }
        
        self.viewController?.displayBeers(viewModel)
    }
}
