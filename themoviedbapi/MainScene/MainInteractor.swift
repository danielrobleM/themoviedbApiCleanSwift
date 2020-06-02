//
//  MainInteractor.swift
//  themoviedbapi
//
//  Created by Daniel on 01-06-20.
//  Copyright (c) 2020 idorm. All rights reserved.
//

import UIKit

protocol MainBusinessLogic {
  func fetchUI(request: Main.UI.Request)
}

protocol MainDataStore {
  //var name: String { get set }
}

class MainInteractor: MainBusinessLogic, MainDataStore {
  var presenter: MainPresentationLogic?
  var worker: MainWorker?

  // MARK:MainBusinessLogic
  func fetchUI(request: Main.UI.Request) {
    worker = MainWorker()
    worker?.doSomeWork()
    let response = Main.UI.Response()
    presenter?.presentUI(response: response)
  }
}
