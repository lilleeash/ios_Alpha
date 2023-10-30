//
//  BeerDetailViewController.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import UIKit

protocol BeerDetailViewControllerDisplayLogic {}

class BeerDetailViewController: UIViewController, BeerDetailViewControllerDisplayLogic {
    
    var dataResult: BeersModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
