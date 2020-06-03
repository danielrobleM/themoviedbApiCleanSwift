//
//  ListMoviesPresenter.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//


import UIKit

protocol ListMoviesPresentationLogic {
  func presentFetchedMovies(response: ListMovies.FetchMovies.Response)
  func presentFetchError(response: ListMovies.Error.Response)
}

class ListMoviesPresenter: ListMoviesPresentationLogic {
  weak var viewController: ListMoviesDisplayLogic?

  // MARK: ListMoviesPresentationLogic
  func presentFetchedMovies(response: ListMovies.FetchMovies.Response) {
    let displayedMovies = response.movies.compactMap {
      return ListMovies.FetchMovies.ViewModel.displayedMovie(title: $0.title)
    }

    let viewModel = ListMovies.FetchMovies.ViewModel(displayedMovies: displayedMovies)
    viewController?.displayFetchedMovies(viewModel: viewModel)
  }

  func presentFetchError(response: ListMovies.Error.Response) {
    let viewModel = ListMovies.Error.ViewModel(errorMessage: "Something when wrong")
    viewController?.displayError(viewModel: viewModel)
  }
}
