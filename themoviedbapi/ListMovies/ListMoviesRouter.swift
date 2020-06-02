//
//  ListMoviesRouter.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

@objc protocol ListMoviesRoutingLogic {
  func routeToMovieVC(_ index: Int)
}

protocol ListMoviesDataPassing {
  var dataStore: ListMoviesDataStore? { get set }
}

class ListMoviesRouter: NSObject, ListMoviesRoutingLogic, ListMoviesDataPassing {
  weak var viewController: ListMoviesViewController?
  var dataStore: ListMoviesDataStore?
  
  // MARK: ListMoviesRoutingLogic
  func routeToMovieVC(_ index: Int) {
    guard let movie = dataStore?.movies?[index] else { return }
    viewController?.didSelectMovie?(movie)
  }
}
