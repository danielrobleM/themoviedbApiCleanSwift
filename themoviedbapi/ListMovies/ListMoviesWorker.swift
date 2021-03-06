//
//  ListMoviesWorker.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.

import UIKit

protocol MoviesStoreProtocol {
  func fetchMovies(completionHandler: @escaping (Result<[MovieModel], MovieDbApiError>) -> Void)
}

class MoviesWorker {
  var moviesStore: MoviesStoreProtocol!

  init(moviesStore: MoviesStoreProtocol) {
    self.moviesStore = moviesStore
  }

  func fetchMovies(completionHandler: @escaping (Result<[MovieModel], MovieDbApiError>) -> Void) {
    moviesStore.fetchMovies(completionHandler: completionHandler)
  }
}
