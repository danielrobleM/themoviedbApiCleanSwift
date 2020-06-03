//
//  ShowMovieWorkerTest.swift
//  themoviedbapiTests
//
//  Created by Daniel on 03-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

@testable import themoviedbapi
import XCTest

class ShowMovieWorkerTest: XCTestCase {

  var sut: ShowMovieWorker!

  override func setUpWithError() throws {
    setupMovieWorker()
  }

  override func tearDownWithError() throws { }

  func setupMovieWorker() {
    sut = ShowMovieWorker(movieStore: MovieApiSpy())
  }

  class MovieApiSpy: MovieStoreProtocol {
    var fetchedPosertCalled = true
    func fetchPoster(urlString: String, completionHandler: @escaping (Result<UIImage, MovieDbApiError>) -> Void) {
      fetchedPosertCalled = true
      completionHandler(.success(UIImage(named: "")!))
    }
  }

  func testShouldShouldReturnUIImage() {
    
  }
}

