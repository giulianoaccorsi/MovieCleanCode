//
//  GenreService.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 28/04/21.
//


import UIKit

protocol GenreService: AnyObject {
    func getGenres(completion: @escaping(Result<[Genre]>) -> Void)
}

class GenreServiceImplemetation: APISetup {
    
    var path: String = "genre/movie/list"
    
    let network: NetworkService
    
    init(networkService: NetworkService) {
        self.network = networkService
    }
    
}

extension GenreServiceImplemetation: GenreService {
    
    func getGenres(completion: @escaping(Result<[Genre]>) -> Void) {
        network.dataRequest(path: path, objectType: GenresResult.self) { (result: Result) in
            switch result {
            case .failure(let error):
                completion(Result.failure(error))
            case .success(let genre):
                completion(Result.success(genre.genres))
            }
        }
    }
    
}
