//
//  MainRouter.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

@objc protocol MainRoutingLogic {
  func routeToSomewhere()
}

protocol MainDataPassing {
  var dataStore: MainDataStore? { get set }
}

class MainRouter: NSObject, MainRoutingLogic, MainDataPassing {
  weak var viewController: MainViewController?
  var dataStore: MainDataStore?
  
  // MARK: MainRoutingLogic
  func routeToSomewhere() {

  }
}
