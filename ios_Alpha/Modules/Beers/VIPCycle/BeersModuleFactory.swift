//
//  BeersModuleConfiguration.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 30.10.2023.
//

final class BeersModuleFactory {
    class func build() -> BeersViewController {
        let viewController = BeersViewController()
        let interactor: BeersBussinessLogic = BeersInteractor()
        let presenter: BeersPresentationLogic = BeersPresenter()
        
        viewController.interactor = interactor
        viewController.interactor?.presenter = presenter
        
        return viewController
    }
}

