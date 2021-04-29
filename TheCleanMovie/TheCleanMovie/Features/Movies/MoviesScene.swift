//
//  MovieScene.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 28/04/21.
//

import UIKit

protocol MoviesPresentOutput: AnyObject {
    func onMovies(movies: [MovieViewModel])
    func onFailed(error: String)
}

class MoviesScene: UIViewController {
    
    var interactor: MovieInteractor?
    
    override func loadView() {
        super.loadView()
        interactor?.fetchMovies()
    }
    
}

extension MoviesScene: MoviesPresentOutput {
    func onMovies(movies: [MovieViewModel]) {
        
    }
    
    func onFailed(error: String) {
        
    }
    
        
}
