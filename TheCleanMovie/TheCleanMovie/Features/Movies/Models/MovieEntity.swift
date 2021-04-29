//
//  Movie.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 04/03/21.
//

import Foundation

class MovieEntity: Codable {
   
    let posterPath: String?
    let id: Int
    let backdropPath: String?
    let genreIDS: [Int]
    let title: String?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case title
        case overview
        case releaseDate = "release_date"
    }
}
