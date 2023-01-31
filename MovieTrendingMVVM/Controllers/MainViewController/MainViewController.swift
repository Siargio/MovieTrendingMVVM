//
//  MainViewController.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 30.01.23.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties

    let customView = MainView()
    var viewModel: MainViewModel = MainViewModel()
    var cellDataSource: [MovieTableCellViewModel] = []

    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        bindViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    // MARK: - Setup

    func configView() {
        title = "Top Trending Movies"
        view.backgroundColor = .systemBackground
        
        setupTableView()
    }

    // MARK: - Action

    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.customView.activityIndicator.startAnimating()
                } else {
                    self.customView.activityIndicator.stopAnimating()
                }
            }
        }

        viewModel.movies.bind { [weak self] movies in
            guard let self = self,
                    let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.customView.tableView.reloadData()
        }
    }
}
