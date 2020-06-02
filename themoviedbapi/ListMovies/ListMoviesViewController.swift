//
//  ListMoviesViewController.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

protocol ListMoviesDisplayLogic: class {
  func displayUI(viewModel: ListMovies.FetchMovies.ViewModel)
}

class ListMoviesViewController: UIViewController, ListMoviesDisplayLogic {
  var interactor: ListMoviesBusinessLogic?
  var router: (NSObjectProtocol & ListMoviesRoutingLogic & ListMoviesDataPassing)?

  // MARK: Object lifecycle
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  private func setup() {
    let viewController = self
    let interactor = ListMoviesInteractor()
    let presenter = ListMoviesPresenter()
    let router = ListMoviesRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }

  // MARK: View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    let request = ListMovies.FetchMovies.Request()
    interactor?.fetchListMovies(request: request)
    view.backgroundColor = .red
  }

  // MARK: ListMoviesDisplayLogic
  func displayUI(viewModel: ListMovies.FetchMovies.ViewModel) {

  }
}
