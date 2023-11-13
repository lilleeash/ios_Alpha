//
//  BeerTableManager.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 30.10.2023.
//

import UIKit

final class BeersTableManager: NSObject {
    var tableData: BeersDataFlow.PresentModuleData.ViewModel = []
}

// MARK: - UITableViewDataSource
extension BeersTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let beerViewModel = tableData[safe: indexPath.row],
            let cell = tableView.dequeueReusableCell(
                withIdentifier: BeersTableViewCell.identifier,
                for: indexPath
            ) as? BeersTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(with: beerViewModel)
        
        return cell
    }
}
