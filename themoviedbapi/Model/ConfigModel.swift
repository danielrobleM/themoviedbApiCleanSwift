//
//  ConfigModel.swift
//  themoviedbapi
//
//  Created by Daniel on 03-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import Foundation

struct ConfigModel: Codable {
  var response: ImageModel

  private enum ConfigModelKey: String, CodingKey {
    case response = "images"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ConfigModelKey.self)
    response = try container.decode(ImageModel.self, forKey: .response)
  }
}

struct ImageModel: Codable {
  let baseUrl: String
  let posterSize: [String]

  private enum ImageModelKey: String, CodingKey {
    case baseUrl = "secure_base_url"
    case posterSize = "poster_sizes"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ImageModelKey.self)
    baseUrl = try container.decode(String.self, forKey: .baseUrl)
    posterSize = try container.decode([String].self, forKey: .posterSize)
  }
}
