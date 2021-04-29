//
//  RequestError.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 28/04/21.
//

import Foundation

enum RequestError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
    case decodingErrorNotFound
    case urlNotFound
}
