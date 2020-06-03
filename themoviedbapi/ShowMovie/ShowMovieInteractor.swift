//
//  ShowMovieInteractor.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

protocol ShowMovieBusinessLogic {
  func getMovie(request: ShowMovie.GetMovie.Request)
  func getPoster(request: ShowMovie.GetPoster.Request)
}

protocol ShowMovieDataStore {
  var movie: MovieModel! { get set }
}

class ShowMovieInteractor: ShowMovieBusinessLogic, ShowMovieDataStore {
  var movie: MovieModel!
  var presenter: ShowMoviePresentationLogic?
  var worker = ShowMovieWorker(movieStore: MovieAPI())
  private var downloadedImage: UIImage?

  // MARK:ShowMovieBusinessLogic
  func getMovie(request: ShowMovie.GetMovie.Request) {
    let response = ShowMovie.GetMovie.Response(movie: movie)
    presenter?.presentMovie(response: response)
  }

  func getPoster(request: ShowMovie.GetPoster.Request) {
    if downloadedImage != nil {
      presenter?.presentPoster(response: ShowMovie.GetPoster.Response(UIImage: downloadedImage!))
    }

    worker.fetchPoster(urlString: buildPathUrl(movie.posterPath)) { [weak self] (response) in
      switch response{
        case .success(let posterImage):
          self?.presenter?.presentPoster(response: ShowMovie.GetPoster.Response(UIImage: posterImage))
        case .failure(let error):
          print(error.errorDescription ?? "")
      }
    }
  }
}


extension ShowMovieInteractor {
  func buildPathUrl(_ pathUrl: String) -> String {
    let baseUrl = ApiConfigurationService.sharedInstance.value(forKey: ApiConfigurationKey.baseUrl)
    let posterSize = ApiConfigurationService.sharedInstance.value(forKey: ApiConfigurationKey.posterSize)
    return baseUrl + posterSize + pathUrl
  }
}
