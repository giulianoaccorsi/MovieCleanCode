//
//  Result.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 28/04/21.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(RequestError)
}
