//
//  ShowMovieModels.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

enum ShowMovie {

  // MARK: Get Movie
  enum GetMovie {
    struct Request { }
    struct Response {
      let movie: MovieModel
    }
    struct ViewModel {
      let title: String
      let overview: String
      let releaseDate: String
    }
  }

  // MARK: Get Poster
   enum GetPoster {
     struct Request { }
     struct Response {
       let UIImage: UIImage
     }
     struct ViewModel {
       let UIImage: UIImage
     }
   }
}
