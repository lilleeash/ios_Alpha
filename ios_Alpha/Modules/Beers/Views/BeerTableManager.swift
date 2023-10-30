//
//  BeerTableManager.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 30.10.2023.
//

import UIKit

final class BeerTableManager: NSObject {
    var tableData: BeersModel
    
    init(tableData: BeersModel) {
        self.tableData = tableData
    }
}

// MARK: - UITableViewDataSource
extension BeerTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BeerTableViewCell.identifier,
            for: indexPath
        ) as? BeerTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: tableData[indexPath.row])
        
        return cell
    }
}
