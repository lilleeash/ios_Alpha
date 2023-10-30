//
//  BeersView.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 23.10.2023.
//

import UIKit

final class BeersUIView: UIView {
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .cyan
        return table
    }()
    
    init(dataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        backgroundColor = .white
        self.tableView.dataSource = dataSource
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("BeersUIView couldn`t init")
    }
    
    private func setUpConstraints() {
        addSubview(tableView)
        
        NSLayoutConstraint.autoresizingMask([
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        ])
    }
}
