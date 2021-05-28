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
    var mockImageWorker: MockImagesWorker!
    
    override func setUp() {
        super.setUp()

        mockImageWorker = MockImagesWorker()
        mockCastingWorker = MockCastingWorker()
        movieDetailViewModel = MovieDetailViewModel(castingWorker: mockCastingWorker,
                                                    imagesWorker: mockImageWorker)
    }

    override func tearDown() {
        
        super.tearDown()
        mockCastingWorker = nil
        mockImageWorker = nil
        movieDetailViewModel = nil
    }
    
    //Here we test if the cast array is empty after failed fetch
    func testCastingMoviesArrayEmpty() {
        
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
    func testCastingMoviesArrayAfterFetching() {
        
        mockCastingWorker.successFetch = true
        movieDetailViewModel?.getMovieCasting(movieId: 1)

        XCTAssertTrue(movieDetailViewModel?.casting.count == 2)
    }
    
    //Here we test if we set the movies fetched into the cast movies array
    func testCastingMovieArray() {
        
        mockCastingWorker.successFetch = true
        movieDetailViewModel?.getMovieCasting(movieId: 1)

        XCTAssertEqual(movieDetailViewModel?.casting, castMovieResponseMock.cast)
    }
    
    //Here we test if we set the images fetched into the images array
    func testImagesMoviesArrayAfterFetching() {
        
        mockImageWorker.successFetch = true
        movieDetailViewModel?.getImages(movieId: 1)

        XCTAssertTrue(movieDetailViewModel?.images.count == 2)
    }
    
    //Here we test if we set the images fetched into the Images array
    func testImagesMovieArray() {
        
        mockImageWorker.successFetch = false
        movieDetailViewModel?.getMovieCasting(movieId: 1)

        XCTAssertTrue(movieDetailViewModel!.images.isEmpty)
    }
}
