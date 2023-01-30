//
//  MainViewController+TableView.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 30.01.23.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        customView.tableView.delegate = self
        customView.tableView.dataSource = self

        self.registerCells()
    }

    func registerCells() {
        customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "\(indexPath.row)"
        return cell

    }
}
