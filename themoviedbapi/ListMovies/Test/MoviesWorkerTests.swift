//
//  MoviesWorkerTests.swift
//  themoviedbapiTests
//
//  Created by Daniel on 02-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

@testable import themoviedbapi
import XCTest

class MoviesWorkerTests: XCTestCase {
  var sut: MoviesWorker!
  static var testMovies: [MovieModel]!

  override func setUpWithError() throws {
    setupMoviesWorker()
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func setupMoviesWorker() {
    sut = MoviesWorker(moviesStore: MoviesAPISpy())
    MoviesWorkerTests.testMovies = [Seeds.Movies.BadBoysforLife, Seeds.Movies.SonictheHedgehog]
  }

  class MoviesAPISpy: MoviesStoreProtocol {
    var fetchMoviesCalled = false
    func fetchMovies(completionHandler: @escaping (Result<[MovieModel], MoviesError>) -> Void) {
      fetchMoviesCalled = true
      completionHandler(.success(MoviesWorkerTests.testMovies))
    }
  }

  // MARK: Tests
  func testFetchMoviesShouldReturnArrayOfMovies() {

    // Given
    let moviesStoresPy = sut.moviesStore as! MoviesAPISpy

    // When
    var fetchedMovies = [MovieModel]()
    let expect = expectation(description: "Wait for fetched a array with movies")

    sut.fetchMovies { (response) in
      switch response {
      case .success(let movies):
        fetchedMovies = movies
        expect.fulfill()
      case .failure(_):
        fetchedMovies.removeAll()
        expect.fulfill()
      }
    }
    waitForExpectations(timeout: 1.1)

    // Then
      XCTAssert(moviesStoresPy.fetchMoviesCalled, "Calling fetchMovies() should ask the data store for a list of movies")
    XCTAssertEqual(fetchedMovies.count, MoviesWorkerTests.testMovies.count, "fetchMovies() should return a list of movies")
  }

}
