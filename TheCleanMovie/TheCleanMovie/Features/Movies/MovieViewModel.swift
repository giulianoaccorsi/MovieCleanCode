//
//  MoviesViewModel.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 28/04/21.
//

import UIKit

struct MovieViewModel {
    let name: String
    let photo: String
    let isFavorite: Bool
    
    init(entity: MovieEntity) {
        name = entity.title ?? ""
        photo = entity.posterPath ?? ""
        isFavorite = false
    }
}
