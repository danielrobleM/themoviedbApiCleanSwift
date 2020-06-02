//
//  MainPresenter.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//


import UIKit

protocol MainPresentationLogic {
  func presentUI(response: Main.UI.Response)
}

class MainPresenter: MainPresentationLogic {
  weak var viewController: MainDisplayLogic?

  // MARK: MainPresentationLogic
  func presentUI(response: Main.UI.Response) {
    let viewModel = Main.UI.ViewModel()
    viewController?.displayUI(viewModel: viewModel)
  }
}
