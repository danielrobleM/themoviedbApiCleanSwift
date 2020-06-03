//
//  UserDefaults+extensions.swift
//  themoviedbapi
//
//  Created by Daniel on 03-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import Foundation

extension UserDefaults {
  func contains(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
  }
}
