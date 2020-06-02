//
//  ListMoviesViewController.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

protocol ListMoviesDisplayLogic: class {
  func displayFetchedMovies(viewModel: ListMovies.FetchMovies.ViewModel)
}

class ListMoviesViewController: UITableViewController, ListMoviesDisplayLogic {
  var interactor: ListMoviesBusinessLogic?
  var router: (NSObjectProtocol & ListMoviesRoutingLogic & ListMoviesDataPassing)?
  var displayedMovies: [ListMovies.FetchMovies.ViewModel.displayedMovie] = []

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
    DispatchQueue.main.async {
      self.tableView.reloadData()
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
    
  }
}
