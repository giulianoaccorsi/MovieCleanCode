//
//  MovieInteractor.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 15/04/21.
//

import Foundation

protocol MovieInteractor: AnyObject {
    func fetchMovies()
}

class MovieInteractorImplementation: MovieInteractor {
    
    private let service: MovieService
    private let presenter: MoviePresenter
    
    init(movieService: MovieService = MovieServiceImplemetation(networkService: NetworkService()), moviePresenter: MoviePresenter) {
        self.service = movieService
        self.presenter = moviePresenter
    }
    
    func fetchMovies() {
        service.getMovies(page: 1) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.presenter.onFailed(error: error)
            case .success(let movies):
                self?.presenter.onMovies(movies: movies)
            }
        }
    }
    
}
