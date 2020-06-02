//
//  MoviesError.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import Foundation

enum MoviesError: Error {
  case invalidURL
  case connectionError
  case invalidResponse
}

extension MoviesError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .invalidURL:
      return NSLocalizedString("Invalid URL for request", comment: "")
      case .connectionError:
      return NSLocalizedString("Somthing when wrong", comment: "")
      case .invalidResponse:
      return NSLocalizedString("Json response invalid", comment: "")
    }
  }
}
