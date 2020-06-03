//
//  ShowMovieInteractor.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

protocol ShowMovieBusinessLogic {
  func getMovie(request: ShowMovie.GetMovie.Request)
}

protocol ShowMovieDataStore {
  var movie: MovieModel! { get set }
}

class ShowMovieInteractor: ShowMovieBusinessLogic, ShowMovieDataStore {
  var movie: MovieModel!

  var presenter: ShowMoviePresentationLogic?
  var worker: ShowMovieWorker?

  // MARK:ShowMovieBusinessLogic
  func getMovie(request: ShowMovie.GetMovie.Request) {
    let response = ShowMovie.GetMovie.Response(movie: movie)
    presenter?.presentMovie(response: response)
  }
}
