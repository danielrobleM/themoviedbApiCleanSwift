//
//  APIConfiguration.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import Foundation

/// Indicates whether updated data was successfully fetched.
enum ApiConfigurationServiceFetchStatus {
  /// Config fetch succeeded.
  case success
  /// Config fetch failed.
  case failure
}

/// Default Configuration values for baseUrl and posterSize
struct ApiConfigurationDefault {
  static let baseUrl = "https://image.tmdb.org/t/p/"
  static let posterSize = "w500"
}

struct ApiConfigurationKey {
  static let baseUrl = "com.themovieApidb.baseUrl"
  static let posterSize = "com.themovieApidb.posterSize"
}

protocol ApiConfigurationProtocol {
  func fetchConfiguration(completionHandler: @escaping (ApiConfigurationServiceFetchStatus) -> Void)
}

class ApiConfigurationService {
  static let sharedInstance = ApiConfigurationService()

  private static var configStore: ApiConfigurationProtocol?

  class func setup(_ configStore: ApiConfigurationProtocol){
    ApiConfigurationService.configStore = configStore
  }

  private init() {
    guard ApiConfigurationService.configStore != nil else {
      fatalError("Error - you must call setup before accessing APIConfiguration.shared")
    }
    loadDefaultConfiguration()
    fetchConfiguration()
  }

  /// Load API Configuration from local struct. The base_url, size and file_path.
  func loadDefaultConfiguration() {
    //Using UserDefaults to simplify implementation, i will use some database in prod.
    UserDefaults.standard.set(ApiConfigurationDefault.baseUrl, forKey: ApiConfigurationKey.baseUrl)
    UserDefaults.standard.set(ApiConfigurationDefault.posterSize, forKey: ApiConfigurationKey.posterSize)
  }

  /// Fecth from API Configuration The base_url, size
  func fetchConfiguration() {
    ApiConfigurationService.configStore!.fetchConfiguration { (status) in
      if status == .success {
        print("Config fetched!")
      }
      /// No try again, because of the defaultConfiguration
    }
  }

  func value(forKey key: String) -> String {
    return UserDefaults.standard.object(forKey: key) as! String
  }
}
