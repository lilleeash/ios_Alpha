//
//  BeersViewController.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 09.10.2023.
//

import UIKit

protocol BeersDisplayLogic {
    var interactor: BeersBussinessLogic? { get }
    var mainView: UIView? { get }
    var model: BeersModel? { get }
    func resultData(data: BeersModel)
}

class BeersViewController: UIViewController, BeersDisplayLogic {
    var mainView: UIView?
    var interactor: BeersBussinessLogic?
    var model: BeersModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        Task {
            try await interactor?.requestData()
        }
    }
    
    func resultData(data: BeersModel) {
        self.model = data
    }
}
