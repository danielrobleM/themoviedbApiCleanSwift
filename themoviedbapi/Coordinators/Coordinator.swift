//
//  Coordinator.swift
//  themoviedbapi
//
//  Created by Daniel on 31-05-20.
//  Copyright © 2020 idorm. All rights reserved.
//
import UIKit
/// Protocol describe a coordinator pattern for navigate between controllers
protocol Coordinator {
  /// Property for store any child coordinators.
  var childs: [Coordinator] { set get }

  /// Property for store any child coordinators.
  var navigationController: UINavigationController { set get }

  /// Use for start all flow on the coodinator
  func start()
}
