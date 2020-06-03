//
//  ShowMovieViewController.swift
//  themoviedbapi
//
//  Created by Daniel on 02-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

protocol ShowMovieDisplayLogic: class {
  func displayMovie(viewModel: ShowMovie.GetMovie.ViewModel)
}

class ShowMovieViewController: UIViewController, ShowMovieDisplayLogic {
  var interactor: ShowMovieBusinessLogic?
  var router: (NSObjectProtocol & ShowMovieRoutingLogic & ShowMovieDataPassing)?

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
    let interactor = ShowMovieInteractor()
    let presenter = ShowMoviePresenter()
    let router = ShowMovieRouter()
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
    let request = ShowMovie.GetMovie.Request()
    interactor?.getMovie(request: request)
    view.backgroundColor = UIColor.systemBackground
  }

  // MARK: ShowMovieDisplayLogic
  func displayMovie(viewModel: ShowMovie.GetMovie.ViewModel) {

  }
}
