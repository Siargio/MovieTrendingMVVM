//
//  DetailsMovieViewController.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 31.01.23.
//

import UIKit
import SDWebImage

final class DetailsMovieViewController: UIViewController {

    // MARK: - Properties

    let customView = DetailsMovieView()
    var viewModel: DetailMovieViewModel

    init(viewModel: DetailMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        configNavigationController()
    }

    // MARK: - Setup

    private func configNavigationController() {
        title = Strings.title
        navigationController?.navigationBar.tintColor = .black
}

    private func configView() {
        customView.nameMovieLabel.text = viewModel.movieTitle
        customView.descriptionsMovieLabel.text = viewModel.movieDescription
        customView.imageViewDetail.sd_setImage(with: viewModel.movieImage)
    }
}

// MARK: - Extension

extension DetailsMovieViewController {
    enum Strings {
        static let title = "Movies Details"
    }
}
