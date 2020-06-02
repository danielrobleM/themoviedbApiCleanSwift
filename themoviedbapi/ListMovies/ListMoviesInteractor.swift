//
//  ListMoviesInteractor.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

protocol ListMoviesBusinessLogic {
  func fetchListMovies(request: ListMovies.FetchMovies.Request)
}

protocol ListMoviesDataStore {
  //var name: String { get set }
}

class ListMoviesInteractor: ListMoviesBusinessLogic, ListMoviesDataStore {
  var presenter: ListMoviesPresentationLogic?
  var worker = MoviesWorker(moviesStore: MoviesAPI())

  // MARK:ListMoviesBusinessLogic
  func fetchListMovies(request: ListMovies.FetchMovies.Request) {
    worker.fetchMovies(completionHandler: { [weak self] (response) in
      switch response {
        case .success(let movies):
          let response = ListMovies.FetchMovies.Response(movies: movies)
          self?.presenter?.presentFetchedMovies(response: response)
        case .failure(let error):
        fatalError()
      }
    })
  }
}
