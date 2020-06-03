//
//  Movie.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
  internal init(id: Int, title: String, releaseDate: String, overview: String, posterPath: String) {
    self.id = id
    self.title = title
    self.releaseDate = releaseDate
    self.overview = overview
    self.posterPath = posterPath
  }

  var id: Int
  var title: String
  var releaseDate: String
  var overview: String
  var posterPath: String

  private enum MovieModelKey: String, CodingKey {
    case id = "id"
    case title = "title"
    case releaseDate = "release_date"
    case overview = "overview"
    case posterPath = "poster_path"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieModelKey.self)
    id = try container.decode(Int.self, forKey: .id)
    title = try container.decode(String.self, forKey: .title)
    releaseDate = try container.decode(String.self, forKey: .releaseDate)
    overview = try container.decode(String.self, forKey: .overview)
    posterPath = try container.decode(String.self, forKey: .posterPath)
  }
}

class ListMovie: NSObject, Codable {
  var page: Int
  var results: [MovieModel]

  private enum ResponseMovieDBKey: String, CodingKey {
    case results = "results"
    case page = "page"
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ResponseMovieDBKey.self)
    results = try container.decode([MovieModel].self, forKey: .results)
    page = try container.decode(Int.self, forKey: .page)
  }
}
