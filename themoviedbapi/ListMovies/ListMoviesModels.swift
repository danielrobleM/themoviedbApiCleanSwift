//
//  ListMoviesModels.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

enum ListMovies {

  // MARK: UI
  enum FetchMovies {
    struct Request {}
    struct Response {
      var movies: [MovieModel]
    }
    struct ViewModel {
      struct displayedMovie {
        let title: String
      }
      var displayedMovies: [displayedMovie]
    }
  }
}
