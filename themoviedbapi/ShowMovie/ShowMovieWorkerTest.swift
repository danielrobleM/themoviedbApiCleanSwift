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
    var fetchedPosterCalled = true
    func fetchPoster(urlString: String, completionHandler: @escaping (Result<UIImage, MovieDbApiError>) -> Void) {
      fetchedPosterCalled = true
      completionHandler(.success(UIImage(named: "uncleBobCheck")!))
    }
  }

  func testFetchedPoserShouldReturnUIImage() {
     // Given
    let store = MovieApiSpy()
    let expect = expectation(description: "Wait for fetched a poster Imager")
    var expectedResponse: UIImage?

    sut.movieStore = store

    // When
    sut.fetchPoster(urlString: "") { (response) in
      switch response{
        case .success(let image):
        expectedResponse = image
        expect.fulfill()
        case .failure(_):
        expectedResponse = nil
        expect.fulfill()
      }
    }
    waitForExpectations(timeout: 20, handler: nil)

    //Then
    XCTAssert(store.fetchedPosterCalled, "FetchMovies() should ask MoviesWorker to fetch Moviews")
    XCTAssertNotNil(expectedResponse)
  }
}

