//
//  ListMoviesInteractorTest.swift
//  themoviedbapiTests
//
//  Created by Daniel on 02-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

@testable import themoviedbapi
import XCTest

class ListMoviesInteractorTest: XCTestCase {
  var sut: ListMoviesInteractor!

  override func setUpWithError() throws {
    setupListMoviesInteractor()
  }

  override func tearDownWithError() throws { }

  func setupListMoviesInteractor() {
    sut = ListMoviesInteractor()
  }

  class ListMoviesPresentationLogicSpy: ListMoviesPresentationLogic {
     // MARK: Method call expectations
     var presentFetchedMoviesCalled = false
     var presentFetchedErrorCalled = false

     // MARK: Spied methods
     func presentFetchedMovies(response: ListMovies.FetchMovies.Response) {
       presentFetchedMoviesCalled = true
     }

     func presentFetchError(response: ListMovies.Error.Response) {
       presentFetchedErrorCalled = true
     }
   }

  class MoviesWorkerSpy: MoviesWorker {
    // MARK: Method call expectations
    var fetchListMoviesCalled = false

    // MARK: Spied methods
    override func fetchMovies(completionHandler: @escaping (Result<[MovieModel], MovieDbApiError>) -> Void) {
      fetchListMoviesCalled = true
      completionHandler(.success([Seeds.Movies.BadBoysforLife, Seeds.Movies.SonictheHedgehog]))
    }
  }

  class MoviesAPISucessSpy: MoviesStoreProtocol {
    var fetchMoviesCalled = false
    func fetchMovies(completionHandler: @escaping (Result<[MovieModel], MovieDbApiError>) -> Void) {
      fetchMoviesCalled = true
      completionHandler(.success(ListMoviesWorker.testMovies))
    }
  }

  func testFetchMoviesShouldAskToMoviesWorkerAndPresent() {
    // Given
    let listMoviesPresentationLogicSpy = ListMoviesPresentationLogicSpy()
    sut.presenter = listMoviesPresentationLogicSpy

    let moviesWorkerSpy = MoviesWorkerSpy(moviesStore: MoviesAPISucessSpy())
    sut.worker = moviesWorkerSpy

    // When
    let request = ListMovies.FetchMovies.Request()
    sut.fetchListMovies(request: request)

    // Then
    XCTAssert(moviesWorkerSpy.fetchListMoviesCalled, "FetchMovies() should ask MoviesWorker to fetch Moviews")
    XCTAssert(listMoviesPresentationLogicSpy.presentFetchedMoviesCalled, "FetchMovies() should ask presenter to format movies result")
  }
}
