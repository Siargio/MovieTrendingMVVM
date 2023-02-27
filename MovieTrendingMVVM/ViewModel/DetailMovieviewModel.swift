//
//  DetailMovieViewModel.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 31.01.23.
//

import Foundation

final class DetailMovieViewModel {

    var movie: Movie
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int

    init(movie: Movie) {
        self.movie = movie

        self.movieID = movie.id
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview
        self.movieImage = makeImageURL(movie.backdropPath)
    }

    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
}
