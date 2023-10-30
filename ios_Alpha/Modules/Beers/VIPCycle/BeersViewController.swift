//
//  BeersViewController.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 09.10.2023.
//

import UIKit

protocol BeersViewControllerDisplayLogic {
    var router: ViewControllerRoutingLogic? { get }
    var interactor: ViewControllerBussinessLogic? { get }
    var mainView: UIView? { get }
    var model: BeersModel? { get }
    func resultData(data: BeersModel)
}

class BeersViewController: UIViewController, BeersViewControllerDisplayLogic {
    var mainView: UIView?
    var router: ViewControllerRoutingLogic?
    var interactor: ViewControllerBussinessLogic?
    var model: BeersModel?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .cyan
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        interactor?.requestData()
        setUpConstraints()
    }
    
    func resultData(data: BeersModel) {
        self.model = data
    }
    
    private func setUpConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}

extension BeersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let beers = model?.count else { return 0 }
        return beers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let beer = model?[indexPath.row] else { return UITableViewCell() }
        let cell = UITableViewCell()
        var configuration = cell.defaultContentConfiguration()
        configuration.text = beer.name
        configuration.secondaryText = beer.tagline
        cell.contentConfiguration = configuration
        return cell
    }
}
