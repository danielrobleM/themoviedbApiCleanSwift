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
    let destinationController = ListMoviesViewController(nibName: nil, bundle: nil)

    destinationController.didSelectMovie = { [weak self ] movie in
      self?.presentMovieInformation(movie)
    }
    navigationController.pushViewController(destinationController, animated: false)
  }

  func presentMovieInformation(_ movie: MovieModel) {
    let destinationController = MovieViewController()
    navigationController.pushViewController(destinationController, animated: true)
  }
}
