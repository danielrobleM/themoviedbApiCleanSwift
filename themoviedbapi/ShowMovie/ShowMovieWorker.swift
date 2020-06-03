//
//  ShowMovieWorker.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.

import UIKit

protocol MovieStoreProtocol {
  func fetchPosterImage(urlString: String, completionHandler: @escaping (Result<UIImage, MovieDbApiError>) -> Void)
}

class ShowMovieWorker {
  var movieStore: MovieStoreProtocol!

  init(movieStore: MovieStoreProtocol) {
    self.movieStore = movieStore
  }

  func fetchPosterImage(urlString: String, completionHandler: @escaping (Result<UIImage, MovieDbApiError>) -> Void) {
    movieStore.fetchPosterImage(urlString: urlString, completionHandler: completionHandler)
  }
}
