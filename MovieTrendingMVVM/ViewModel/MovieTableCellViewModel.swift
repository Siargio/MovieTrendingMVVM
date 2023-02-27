//
//  MovieTableCellViewModel.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 30.01.23.
//

import Foundation

final class MovieTableCellViewModel {
    var id: Int
    var name: String
    var date: String
    var score: String
    var image: URL?

    init(movie: Movie) {
        self.id = movie.id
        self.name = movie.name ?? movie.title ?? ""
        self.score = "\(movie.voteAverage)/10"
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.image = makeImageURL(movie.posterPath)
    }

    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAdress)\(imageCode)")
    }
}
