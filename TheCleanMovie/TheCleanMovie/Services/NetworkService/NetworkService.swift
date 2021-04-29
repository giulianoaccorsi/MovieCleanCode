//
//  NetworkService.swift
//  TheCleanMovie
//
//  Created by Giuliano Accorsi on 14/04/21.
//

import Foundation

struct NetworkService {
    
    private let baseURL = "https://api.themoviedb.org/3/"
    private let apiKey = "e67ebe33d00c9960fe5c35b3e75a1b22"
    
    func dataRequest<T: Decodable>(path: String, objectType: T.Type, parameters: [String:String]=[:], completion: @escaping (Result<T>) -> Void) {
        
        guard var dataURL = URLComponents(string: baseURL + path) else {return}
        
        dataURL.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        dataURL.queryItems?.append(URLQueryItem(name: "api_key", value: apiKey))
        
        guard let url = dataURL.url else {
            completion(Result.failure(.urlNotFound))
            return
        }
        
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if let error = error {
                completion(Result.failure(RequestError.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(Result.failure(RequestError.dataNotFound))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                guard let errorDecoding = error as? DecodingError else {
                    completion(Result.failure(RequestError.decodingErrorNotFound))
                    return
                }
                completion(Result.failure(RequestError.jsonParsingError(errorDecoding)))
            }
        })
        
        task.resume()
    }

}
