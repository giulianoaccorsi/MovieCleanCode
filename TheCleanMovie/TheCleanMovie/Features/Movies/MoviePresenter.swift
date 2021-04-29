//
//  MoviePresenter.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 28/04/21.
//

import Foundation

protocol MoviePresenter: AnyObject {
    func onMovies(movies: [MovieEntity])
    func onFailed(error: Error)
}

class MoviePresenterImplementation: MoviePresenter {
    
    weak var output: MoviesPresentOutput?
    
    func onMovies(movies: [MovieEntity]) {
        output?.onMovies(movies: movies.map { MovieViewModel(entity: $0) })
    }
    
    func onFailed(error: Error) {
        output?.onFailed(error: error.localizedDescription)
    }
    
}

