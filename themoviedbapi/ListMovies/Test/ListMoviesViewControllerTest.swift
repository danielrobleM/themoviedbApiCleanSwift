//
//  ListMoviesViewControllerTest.swift
//  themoviedbapiTests
//
//  Created by Daniel on 03-06-20.
//  Copyright © 2020 idorm. All rights reserved.
//

@testable import themoviedbapi
import XCTest

class ListMoviesViewControllerTest: XCTestCase {

  var sut: ListMoviesViewController!

  override func setUpWithError() throws {
    setupListMoviesViewController()
  }

  override func tearDownWithError() throws {}

  func setupListMoviesViewController() {
    sut = ListMoviesViewController(nibName: nil, bundle: nil)
  }

  class ListMoviesBusinessLogicSpy: ListMoviesBusinessLogic {
    var fetchMoviesCalled = false
    func fetchListMovies(request: ListMovies.FetchMovies.Request) {
      fetchMoviesCalled = true
    }
  }

  func testShouldFetchMoviesWhenViewDidLoad() {
    // Given
    let listMoviesBusinessLogicSpy = ListMoviesBusinessLogicSpy()
    sut.interactor = listMoviesBusinessLogicSpy

    // When
    sut.viewDidLoad()

    // Then
    XCTAssert(listMoviesBusinessLogicSpy.fetchMoviesCalled, "Should fetch movies right after the view did load")
  }
}
