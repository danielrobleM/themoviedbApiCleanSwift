//
//  MainViewController.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

protocol MainDisplayLogic: class {
  func displayUI(viewModel: Main.UI.ViewModel)
}

class MainViewController: UIViewController, MainDisplayLogic {
  var interactor: MainBusinessLogic?
  var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?

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
    let interactor = MainInteractor()
    let presenter = MainPresenter()
    let router = MainRouter()
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
    let request = Main.UI.Request()
    interactor?.fetchUI(request: request)
    view.backgroundColor = .red
  }

  // MARK: MainDisplayLogic
  func displayUI(viewModel: Main.UI.ViewModel) {

  }
}
