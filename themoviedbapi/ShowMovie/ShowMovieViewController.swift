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
  func displayPoster(viewModel: ShowMovie.GetPoster.ViewModel)
}

class ShowMovieViewController: UIViewController, ShowMovieDisplayLogic {
  var interactor: ShowMovieBusinessLogic?
  var router: (NSObjectProtocol & ShowMovieRoutingLogic & ShowMovieDataPassing)?

  let posterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

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

   // MARK: UI Setup
  func setupUI() {
    setupPosterImageView()
  }

  func setupPosterImageView() {
    view.addSubview(posterImageView)
    posterImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    posterImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    posterImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    posterImageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }

  // MARK: View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.systemBackground
    interactor?.getMovie(request: ShowMovie.GetMovie.Request())
    interactor?.getPoster(request: ShowMovie.GetPoster.Request())
    setupUI()
  }

  // MARK: ShowMovieDisplayLogic
  func displayMovie(viewModel: ShowMovie.GetMovie.ViewModel) {
    DispatchQueue.main.async { [weak self ] in
      self?.title = viewModel.title
    }
  }

  func displayPoster(viewModel: ShowMovie.GetPoster.ViewModel) {
    DispatchQueue.main.async { [weak self ] in
      self?.posterImageView.image = viewModel.UIImage
    }
  }
}
