//
//  ShowMoviePresenter.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//


import UIKit

protocol ShowMoviePresentationLogic {
  func presentMovie(response: ShowMovie.GetMovie.Response)
  func presentPoster(response: ShowMovie.GetPoster.Response)
}

class ShowMoviePresenter: ShowMoviePresentationLogic {
  weak var viewController: ShowMovieDisplayLogic?

  // MARK: ShowMoviePresentationLogic
  func presentMovie(response: ShowMovie.GetMovie.Response) {
    let viewModel = ShowMovie.GetMovie.ViewModel(
      title: response.movie.title,
      overview: response.movie.overview,
      releaseDate: response.movie.releaseDate
    )
    viewController?.displayMovie(viewModel: viewModel)
  }

  func presentPoster(response: ShowMovie.GetPoster.Response) {
    viewController?.displayPoster(viewModel: ShowMovie.GetPoster.ViewModel(UIImage: response.UIImage))
  }
}
