//
//  MoviesAPI.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import Foundation

class MoviesAPI: MoviesStoreProtocol {

  func fetchMovies(completionHandler: @escaping (Result<[MovieModel], MoviesError>) -> Void) {
    let endpoint = "https://api.themoviedb.org/3/trending/movie/week?api_key=d5a8fc9d9687cb5cb23f9786fdcb80f5"

    guard let url = URL(string: endpoint) else {
      completionHandler(.failure(MoviesError.invalidURL))
      return
    }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        /// print error from request for more info. return ConnectionError.
        print(error.localizedDescription)
        completionHandler(.failure(MoviesError.connectionError))
        return
      }

      guard let data = data else {
        completionHandler(.failure(MoviesError.connectionError))
        return
      }

      do {
        let response = try  JSONDecoder().decode(ListMovie.self, from: data)
        completionHandler(.success(response.results))
       } catch let jsonError {
        print(jsonError.localizedDescription)
        completionHandler(.failure(MoviesError.invalidResponse))
       }

    }
    task.resume()

  }
}
