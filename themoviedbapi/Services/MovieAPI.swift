//
//  MovieAPI.swift
//  themoviedbapi
//
//  Created by Daniel on 03-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import UIKit

class MovieAPI: MovieStoreProtocol {
  func fetchPoster(urlString: String, completionHandler: @escaping (Result<UIImage, MovieDbApiError>) -> Void) {
    guard let url = URL(string: urlString) else {
      completionHandler(.failure(MovieDbApiError.invalidURL))
      return
    }

    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      guard let data = data, let image = UIImage(data: data) else {
        print("Error downloading \(urlString): " + String(describing: error))
        completionHandler(.failure(MovieDbApiError.invalidResponse))
        return
      }
      completionHandler(.success(image))
    })
    task.resume()
  }
}
