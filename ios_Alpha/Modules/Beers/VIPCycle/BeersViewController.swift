//
//  BeersViewController.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 09.10.2023.
//

import UIKit

protocol BeersDisplayLogic: AnyObject {
    func displayBeers(_ viewModel: BeersDataFlow.PresentModuleData.ViewModel)
}

final class BeersViewController: UIViewController, BeersDisplayLogic {
    
    lazy var contentView: BeersView = {
        let view = BeersView()
        view.delegate = self
        return view
    }()
    
    private let interactor: BeersBussinessLogic
    
    init(interactor: BeersBussinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            try await interactor.requestData()
        }
    }
    
    func displayBeers(_ viewModel: BeersDataFlow.PresentModuleData.ViewModel) {
        contentView.configure(with: viewModel)
    }
}

extension BeersViewController: BeersTableViewDelegate {
    func didSelectRow(_ beerModel: BeersDataFlow.PresentModuleData.ItemViewModel) {
        <#code#>
    }
}
