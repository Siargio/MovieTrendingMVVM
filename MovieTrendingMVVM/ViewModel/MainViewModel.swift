//
//  MainViewModel.swift
//  MovieTrendingMVVM
//
//  Created by Sergio on 30.01.23.
//

import Foundation

final class MainViewModel {

    var isLoading: Observable<Bool> = Observable(false)
    var movies: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMoviesModel?

    func numberOfSections() -> Int {
        1
    }

    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }

    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false

            switch result {
            case .success(let trendingMovieData):

                self?.dataSource = trendingMovieData
                self?.mapMovieData()
            case .failure(let error):
                print(error )
            }
        }
    }

    func mapMovieData() {
        movies.value  = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }

    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }

    func retriveMovie(withId id: Int) -> Movie? {
        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
}
