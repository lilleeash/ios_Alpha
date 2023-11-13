//
//  BeerTableManager.swift
//  ios_Alpha
//
//  Created by Darya Zhitova on 30.10.2023.
//

import UIKit

// MARK: - BeersTableManagerDelegate
protocol BeersTableManagerDelegate {
    func didSelectRow(_ beerModel: BeersDataFlow.PresentModuleData.ItemViewModel)
}

final class BeersTableManager: NSObject {
    var delegate: BeersTableManagerDelegate?
    var tableData: BeersDataFlow.PresentModuleData.ViewModel = []
}

// MARK: - UITableViewDataSource
extension BeersTableManager: UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
