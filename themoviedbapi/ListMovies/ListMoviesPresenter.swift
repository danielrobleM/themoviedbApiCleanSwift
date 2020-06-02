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
}
