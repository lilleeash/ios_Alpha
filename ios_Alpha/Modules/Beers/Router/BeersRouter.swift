//
//  BeersRouter.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import Foundation
import UIKit

protocol BeersRoutingLogic {
    func routeToSecondViewController(_ data: BeersModel?)
}

class BeersRouter: NSObject, BeersRoutingLogic {
    
    weak var viewController: BeersViewController?
    weak var secondViewController : BeerDetailViewController?
 
    func routeToSecondViewController(_ data: BeersModel?) {
        guard let secondViewController else { return }
        
        secondViewController.dataResult = data
        viewController?.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

