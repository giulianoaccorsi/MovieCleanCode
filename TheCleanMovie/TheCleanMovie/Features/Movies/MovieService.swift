//
//  File.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 10/04/21.
//

import UIKit

protocol MovieService: AnyObject {
    func getMovies(page: Int, completion: @escaping ((Result<[MovieEntity]>) -> Void))
}

class MovieServiceImplemetation: APISetup {
    
    var path: String = "movie/popular"
    
    let network: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.network = networkService
    }
    
}

extension MovieServiceImplemetation: MovieService {
    
    func getMovies(page: Int, completion: @escaping (Result<[MovieEntity]>) -> Void){
        let parameters: [String:String] = ["page": String(page)]
        network.dataRequest(path: path, objectType: MoviesEntity.self, parameters: parameters) { (result: Result) in
            switch result {
            case .failure(let error):
                completion(Result.failure(error))
            case .success(let movie):
                completion(Result.success(movie.movieList))
            }
        }
    }
    
}
