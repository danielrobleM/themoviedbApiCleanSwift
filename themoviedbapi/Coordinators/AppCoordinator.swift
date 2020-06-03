//
//  AppCoordinator.swift
//  themoviedbapi
//
//  Created by Daniel on 31-05-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import UIKit
class AppCoordinator: Coordinator {
  var childs: [Coordinator] = []
  var navigationController: UINavigationController

  init(_ nav: UINavigationController) {
    navigationController = nav
  }

  func start() {
    setupApiConfiguration()
    presentListMovies()
  }

  func setupApiConfiguration() {
    ApiConfigurationService.setup(ApiConfiguration())
    _ = ApiConfigurationService.sharedInstance
  }

  func presentListMovies() {
    let destinationController = ListMoviesViewController(nibName: nil, bundle: nil)

    destinationController.didSelectMovie = { [weak self ] movie in
      self?.presentMovieInformation(movie)
    }
    navigationController.pushViewController(destinationController, animated: false)
  }

  func presentMovieInformation(_ movie: MovieModel) {
    let destinationController = ShowMovieViewController()
    var destinationDataStore = destinationController.router!.dataStore!
    passDataToShowMovieDataStore(value: movie, destination: &destinationDataStore)
    navigationController.pushViewController(destinationController, animated: true)
  }
}

extension AppCoordinator {

  func passDataToShowMovieDataStore(value: MovieModel, destination: inout ShowMovieDataStore) {
    destination.movie = value
  }
}
