//
//  DetailsC.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 26.02.23.
//

import UIKit
import SDWebImage

class DetailsC: UIViewController {

    // MARK: - Properties

    let customView = DetailsMovieView()
    var viewModel: DetailMovieViewModel

    init(viewModel: DetailMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
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
    }

    // MARK: - Setup

    func configView() {
        self.title = "Movies Details"
        customView.nameMovieLabel.text = viewModel.movieTitle
        customView.descriptionsMovieLabel.text = viewModel.movieDescription
        customView.imageViewDetail.sd_setImage(with: viewModel.movieImage)
    }
}
