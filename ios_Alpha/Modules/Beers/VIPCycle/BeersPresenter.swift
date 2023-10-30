//
//  BeersPresenter.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import Foundation

protocol ViewControllerPresentationLogic {
    func presentData(data: BeersModel)
}

class BeersPresenter: ViewControllerPresentationLogic {
    
    var displayViewController: BeersViewControllerDisplayLogic?
    
    func presentData(data: BeersModel) {
        let result = data
        self.displayViewController?.resultData(data: result)
    }
}
