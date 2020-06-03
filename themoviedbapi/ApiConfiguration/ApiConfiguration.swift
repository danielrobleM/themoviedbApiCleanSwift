//
//  ApiConfiguration.swift
//  themoviedbapi
//
//  Created by Daniel on 03-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import Foundation


class ApiConfiguration: ApiConfigurationProtocol {
  func fetchConfiguration(completionHandler: @escaping (ApiConfigurationServiceFetchStatus) -> Void) {
    let endpoint = "https://api.themoviedb.org/3/configuration?api_key=d5a8fc9d9687cb5cb23f9786fdcb80f5"

    guard let url = URL(string: endpoint) else {
      completionHandler(ApiConfigurationServiceFetchStatus.failure)
      return
    }

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
        /// print error from request for more info. return ConnectionError.
        print(error.localizedDescription)
        completionHandler(.failure)
        return
      }

      guard let data = data else {
        completionHandler(.failure)
        return
      }

      do {
        let configModel = try  JSONDecoder().decode(ConfigModel.self, from: data)
        //Using UserDefaults to simplify implementation, i will use some database in prod.
        UserDefaults.standard.set(configModel.response.baseUrl, forKey: ApiConfigurationKey.baseUrl)
        UserDefaults.standard.set(configModel.response.posterSize[5], forKey: ApiConfigurationKey.posterSize)
        completionHandler(.success)
       } catch let jsonError {
        print(jsonError.localizedDescription)
        completionHandler(.failure)
       }

    }
    task.resume()
  }
}
