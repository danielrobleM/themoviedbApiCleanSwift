//
//  AppCoordinator.swift
//  themoviedbapi
//
//  Created by Daniel on 31-05-20.
//  Copyright © 2020 idorm. All rights reserved.
//

import UIKit
class AppCoordinator: Coordinator {
  var childs: [Coordinator] = []
  var navigationController: UINavigationController

  init(_ nav: UINavigationController) {
    navigationController = nav
  }

  func start() {
    let destinationController = ViewController()
    navigationController.pushViewController(destinationController, animated: false)
  }
}
