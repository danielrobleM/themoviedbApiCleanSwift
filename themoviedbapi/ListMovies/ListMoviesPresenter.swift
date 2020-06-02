//
//  ListMoviesPresenter.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//


import UIKit

protocol ListMoviesPresentationLogic {
  func presentUI(response: ListMovies.FetchMovies.Response)
}

class ListMoviesPresenter: ListMoviesPresentationLogic {
  weak var viewController: ListMoviesDisplayLogic?

  // MARK: ListMoviesPresentationLogic
  func presentUI(response: ListMovies.FetchMovies.Response) {
    let viewModel = ListMovies.FetchMovies.ViewModel()
    viewController?.displayUI(viewModel: viewModel)
  }
}
