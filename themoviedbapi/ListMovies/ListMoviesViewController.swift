//
//  ListMoviesViewController.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

// MARK:- Typealiases
typealias ListMoviesCompletionBlock = (MovieModel)-> Void

protocol ListMoviesDisplayLogic: class {
  func displayFetchedMovies(viewModel: ListMovies.FetchMovies.ViewModel)
  func displayError(viewModel: ListMovies.Error.ViewModel)
}

class ListMoviesViewController: UITableViewController, ListMoviesDisplayLogic {
  var interactor: ListMoviesBusinessLogic?
  var router: (NSObjectProtocol & ListMoviesRoutingLogic & ListMoviesDataPassing)?
  var displayedMovies: [ListMovies.FetchMovies.ViewModel.displayedMovie] = []

  var didSelectMovie: ListMoviesCompletionBlock?

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
    self.title = "Trending Movies"
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "moviesID")
    let request = ListMovies.FetchMovies.Request()
    interactor?.fetchListMovies(request: request)
  }

  // MARK: ListMoviesDisplayLogic
  func displayFetchedMovies(viewModel: ListMovies.FetchMovies.ViewModel) {
    displayedMovies = viewModel.displayedMovies
    DispatchQueue.main.async { [weak self ] in
      self?.tableView.reloadData()
    }
  }

  func displayError(viewModel: ListMovies.Error.ViewModel) {
    DispatchQueue.main.async { [weak self ] in
      let alert = UIAlertController(title: nil, message:  viewModel.errorMessage, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "ok", style: .default))
      self?.present(alert, animated: true)
    }
  }

  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayedMovies.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "moviesID", for: indexPath)
    let movie = displayedMovies[indexPath.row]
    cell.textLabel?.text = movie.title
    return cell
   }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    router?.routeToMovieVC(indexPath.row)
  }
}
