//
//  BeersViewController.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 09.10.2023.
//

import UIKit

protocol BeersDisplayLogic {
    var interactor: BeersBussinessLogic? { get }
    var model: BeersModel? { get }
    var contentView: BeersView { get }
    func resultData(data: BeersModel)
}

class BeersViewController: UIViewController, BeersDisplayLogic {
    var interactor: BeersBussinessLogic?
    var model: BeersModel?
    
    lazy var contentView: BeersView = {
        let view = BeersView()
        return view
    }()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            try await interactor?.requestData()
        }
    }
    
    func resultData(data: BeersModel) {
        self.model = data
    }
}
