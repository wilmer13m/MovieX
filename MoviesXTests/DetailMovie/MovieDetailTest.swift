//
//  MovieDetail.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import XCTest
@testable import MoviesX

class MovieDetailTest: XCTestCase {

    var movieDetailViewModel: MovieDetailViewModel!
    var mockCastingWorker: MockCastingWorker!
    
    override func setUp() {
        super.setUp()

        mockCastingWorker = MockCastingWorker()
        movieDetailViewModel = MovieDetailViewModel(castingWorker: mockCastingWorker)
    }

    override func tearDown() {
        
        super.tearDown()
        mockCastingWorker = nil
        movieDetailViewModel = nil
    }
    
    //Here we test if the cast array is empty after failed fetch
    func testPopularMoviesArrayEmpty() {
        
        mockCastingWorker.successFetch = false
        movieDetailViewModel?.getMovieCasting(movieId: 1)
        XCTAssertTrue(movieDetailViewModel?.casting.count == 0)
    }

    //Here we test if we show the alert after fetch failed
    func testShowAlertAfterFetchFail() {
        
        mockCastingWorker.successFetch = false
        movieDetailViewModel?.getMovieCasting(movieId: 1)
        
        XCTAssertTrue(movieDetailViewModel?.showAlert == true)
    }
    
    //Here we test if we set the movies fetched into the cast array
    func testPopularMoviesArrayAfterFetching() {
        
        mockCastingWorker.successFetch = true
        movieDetailViewModel?.getMovieCasting(movieId: 1)

        XCTAssertTrue(movieDetailViewModel?.casting.count == 2)
    }
    
    //Here we test if we set the movies fetched into the cast movies array
    func testPopularMoviesArray() {
        
        mockCastingWorker.successFetch = true
        movieDetailViewModel?.getMovieCasting(movieId: 1)

        XCTAssertEqual(movieDetailViewModel?.casting, castMovieResponseMock.cast)
    }
}
