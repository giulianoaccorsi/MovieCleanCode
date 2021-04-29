//
//  MovieConfigurator.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 28/04/21.
//

import Foundation

class MoviesConfigurator {
    
    static func configureModule(viewController: MoviesScene) {
        
        let service = MovieServiceImplemetation(networkService: NetworkService())
        let presenter = MoviePresenterImplementation()
        let interactor = MovieInteractorImplementation(movieService: service, moviePresenter: presenter)
        
        presenter.output = viewController
        viewController.interactor = interactor
    }
}

