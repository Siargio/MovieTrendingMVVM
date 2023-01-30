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

    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    // MARK: - Setup

    func configView() {
        view.backgroundColor = .white
        setupTableView()
    }

    // MARK: - Action

}
