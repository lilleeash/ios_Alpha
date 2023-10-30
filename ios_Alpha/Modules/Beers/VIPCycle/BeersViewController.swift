//
//  BeersViewController.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 09.10.2023.
//

import UIKit

protocol BeersDisplayLogic {
    var router: BeersRoutingLogic? { get }
    var interactor: BeersBussinessLogic? { get }
    var mainView: UIView? { get }
    var model: BeersModel? { get }
    func resultData(data: BeersModel)
}

class BeersViewController: UIViewController, BeersDisplayLogic {
    var mainView: UIView?
    var router: BeersRoutingLogic?
    var interactor: BeersBussinessLogic?
    var model: BeersModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        interactor?.requestData()
    }
    
    func resultData(data: BeersModel) {
        self.model = data
    }
}

extension BeersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let beers = model?.count else { return 0 }
        return beers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier, for: indexPath) as? BeerTableViewCell else { return UITableViewCell() }
        
        guard let model else { return UITableViewCell() }
        
        cell.configure(with: model[indexPath.row])
        
        return cell
    }
}
