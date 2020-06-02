//
//  ListMoviesModels.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

enum ListMovies {

  // MARK: Fetch Movies
  enum FetchMovies {
    struct Request {}
    struct Response {
      let movies: [MovieModel]
    }
    struct ViewModel {
      struct displayedMovie {
        let title: String
      }
      var displayedMovies: [displayedMovie]
    }
  }
  // MARK: Fetch Error
  enum Error {
    struct Request { }
    struct Response { }
    struct ViewModel {
      let errorMessage: String
    }
  }
}
