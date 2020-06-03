//
//  ShowMovieRouter.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

@objc protocol ShowMovieRoutingLogic { }

protocol ShowMovieDataPassing {
  var dataStore: ShowMovieDataStore? { get }
}

class ShowMovieRouter: NSObject, ShowMovieRoutingLogic, ShowMovieDataPassing {
  weak var viewController: ShowMovieViewController?
  var dataStore: ShowMovieDataStore?
  
  // MARK: ShowMovieRoutingLogic
}
