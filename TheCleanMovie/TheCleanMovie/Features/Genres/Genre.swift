//
//  Genre.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 04/03/21.
//

import Foundation

// MARK: - Movie
struct GenresResult: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}
