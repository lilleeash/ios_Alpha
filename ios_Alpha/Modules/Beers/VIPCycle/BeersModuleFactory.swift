//
//  BeersModuleConfiguration.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 30.10.2023.
//

final class BeersModuleFactory {
    class func build() -> BeersViewController {
        let presenter = BeersPresenter()
        let interactor = BeersInteractor(presenter: presenter)
        let viewController = BeersViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}

