//
//  BeersView.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import UIKit

protocol BeersTableViewDelegate {
    func didSelectRow(_ beerModel: BeersDataFlow.PresentModuleData.ItemViewModel)
}

final class BeersView: UIView {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .cyan
        table.dataSource = tableManager
        table.delegate = tableManager
        table.register(BeersTableViewCell.self, forCellReuseIdentifier: BeersTableViewCell.identifier)
        return table
    }()
    
    private lazy var tableManager = BeersTableManager()
    var delegate: BeersTableViewDelegate?
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        setUpConstraints()
        tableManager.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("BeersUIView couldn`t init")
    }
    
    func configure(with viewModel: BeersDataFlow.PresentModuleData.ViewModel) {
        tableManager.tableData = viewModel
        tableView.reloadData()
    }
}

extension BeersView: BeersTableManagerDelegate {
    func didSelectRow(_ beerModel: BeersDataFlow.PresentModuleData.ItemViewModel) {
        delegate?.didSelectRow(beerModel)
    }
}

// MARK: - private

private extension BeersView {
    private func addSubviews() {
        [tableView].forEach {
            self.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.autoresizingMask([
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
}
