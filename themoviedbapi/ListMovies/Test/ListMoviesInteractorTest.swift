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
    // Put setup code here. This method is called before the invocation of each test method in the class.
    setupListMoviesInteractor()
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func setupListMoviesInteractor() {
    sut = ListMoviesInteractor()
  }

  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }

  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }

  class MoviesWorkerSpy: MoviesWorker {
    // MARK: Method call expectations
    var fetchListMoviesCalled = false

    // MARK: Spied methods
    override func fetchMovies(completionHandler: @escaping (Result<[MovieModel], MovieDbApiError>) -> Void) {
      completionHandler(.success([Seeds.Movies.BadBoysforLife, Seeds.Movies.SonictheHedgehog]))
    }
  }

  func testFetchMovies() {
    // Given

    // When

    // Then
  }

  func testFetchMoviesMustReturnAListOfMovies() {

  }
}
