//
//  HomeViewModelTest.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 26/5/21.
//

import XCTest
@testable import MoviesX

class HomeViewModelTest: XCTestCase {

    var homeViewModel: HomeViewModel!
    var mockPopularMovieWorker: MockPopularMoviesWorker!
    var mockTopRatedMoviesWorker: MockTopRatedMoviesWorker!
    var mockUpcomingMoviesWorker: MockUpcomingMoviesWorker!
    var mockNowPlayingMoviesWorker: MockNowPlayingMoviesWorker!

    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        mockPopularMovieWorker = MockPopularMoviesWorker()
        mockTopRatedMoviesWorker = MockTopRatedMoviesWorker()
        mockUpcomingMoviesWorker = MockUpcomingMoviesWorker()
        mockNowPlayingMoviesWorker = MockNowPlayingMoviesWorker()
        homeViewModel = HomeViewModel(popularWorker: mockPopularMovieWorker,
                                      topRatedWorker: mockTopRatedMoviesWorker,
                                      upComingWorker: mockUpcomingMoviesWorker,
                                      nowPlayingWorker: mockNowPlayingMoviesWorker)
    }
    
    override func tearDown() {
        
        homeViewModel = nil
        mockPopularMovieWorker = nil
        mockTopRatedMoviesWorker = nil
        mockUpcomingMoviesWorker = nil
        mockNowPlayingMoviesWorker = nil
        super.tearDown()
    }
   
    //MARK:- Popular movies related test
    
    //Here we test if the popular array is empty
    func testPopularMoviesArrayEmpty() {
        
        mockPopularMovieWorker.successFetch = false
        homeViewModel?.loadMovies(by: .popular)
        
        XCTAssertTrue(homeViewModel?.popularMovies.count == 0)
    }

    //Here we test if we show the alert after fetch failed
    func testShowAlertAfterFetchFail() {
        
        mockPopularMovieWorker.successFetch = false
        homeViewModel?.loadMovies(by: .popular)
        
        XCTAssertTrue(homeViewModel?.showAlert == true)
    }
    
    //Here we test if we set the movies fetched into the popular movies array
    func testPopularMoviesArrayAfterFetching() {
        
        mockPopularMovieWorker.successFetch = true
        homeViewModel?.loadMovies(by: .popular, showFirstPage: false)

        XCTAssertTrue(homeViewModel?.popularMovies.count == 2)
    }
    
    //Here we test if we set the movies fetched into the popular movies array
    func testPopularMoviesArray() {
        
        mockPopularMovieWorker.successFetch = true
        homeViewModel?.loadMovies(by: .popular, showFirstPage: false)

        XCTAssertEqual(homeViewModel?.popularMovies, moviesMockResponse.movies)
    }
    
    //Here we test that alert is not showed when fetch is success
    func testNoShowAlertAfterSuccessFecthPopularMovies() {
        
        mockPopularMovieWorker.successFetch = true
        homeViewModel?.loadMovies(by: .popular)
        
        XCTAssertTrue(homeViewModel?.showAlert == false)
    }
    
    // We test if the last item of popular movies array is displayed
    func testLastItemArrayPopular() {
        
        mockPopularMovieWorker.successFetch = true
        homeViewModel?.loadMovies(by: .popular)
        XCTAssertTrue(homeViewModel.loadMoreMovies(for: .popular, movie: moviesMockResponse.movies!.last!))
    }
    
    // We test if the last item of popular movies array is displayed
    func testNotLastItemArrayPopular() {
        
        mockPopularMovieWorker.successFetch = true
        homeViewModel?.loadMovies(by: .popular)
        
        XCTAssertFalse(homeViewModel.loadMoreMovies(for: .popular, movie: moviesMockResponse.movies!.first!))

    }
    //MARK:- TopRated movies related test
    
    //Here we test if the topRated array is empty
    func testTopRatedMoviesArrayEmpty() {
        
        mockTopRatedMoviesWorker.successFetch = false
        homeViewModel?.loadMovies(by: .topRated)
        
        XCTAssertTrue(homeViewModel?.topRatedMovies.count == 0)
    }

    //Here we test if we show the alert after fetch failed
    func testShowAlertAfterTopRatedFetchFail() {
        
        mockTopRatedMoviesWorker.successFetch = false
        homeViewModel?.loadMovies(by: .topRated)
        
        XCTAssertTrue(homeViewModel?.showAlert == true)
    }
    
    //Here we test if we set the movies fetched into the popular movies array
    func testTopRatedMoviesArrayAfterFetching() {
        
        mockTopRatedMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .topRated, showFirstPage: false)

        XCTAssertTrue(homeViewModel?.topRatedMovies.count == 2)
    }
    
    //Here we test if we set the movies fetched into the popular movies array
    func testTopRatedMoviesArray() {
        
        mockTopRatedMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .topRated, showFirstPage: false)

        XCTAssertEqual(homeViewModel?.topRatedMovies, moviesMockResponse.movies)
    }
    
    //Here we test that alert is not showed when fetch is success
    func testNoShowAlertAfterSuccessFecthTopRatedMovies() {
        
        mockTopRatedMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .topRated)
        
        XCTAssertTrue(homeViewModel?.showAlert == false)
    }
    
    // We test if the last item of TopRated movies array is displayed
    func testLastItemArrayTopRated() {
        
        mockTopRatedMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .topRated)
        XCTAssertTrue(homeViewModel.loadMoreMovies(for: .topRated, movie: moviesMockResponse.movies!.last!))
    }
    
    // We test if the last item of TopRated movies array is displayed
    func testNotLastItemArrayTopRated() {
        
        mockPopularMovieWorker.successFetch = true
        homeViewModel?.loadMovies(by: .nowPlaying)
        
        XCTAssertFalse(homeViewModel.loadMoreMovies(for: .nowPlaying, movie: moviesMockResponse.movies!.first!))
    }
    
    //MARK:- Upcoming movies related test
    
    //Here we test if the upcoming array is empty
    func testUpcomingMoviesArrayEmpty() {
        
        mockUpcomingMoviesWorker.successFetch = false
        homeViewModel?.loadMovies(by: .upComing)
        
        XCTAssertTrue(homeViewModel?.upcomingMovies.count == 0)
    }

    //Here we test if we show the alert after fetch failed
    func testShowAlertAfterUpcomingFetchFail() {
        
        mockUpcomingMoviesWorker.successFetch = false
        homeViewModel?.loadMovies(by: .upComing)
        
        XCTAssertTrue(homeViewModel?.showAlert == true)
    }
    
    //Here we test if we set the movies fetched into the upcoming movies array
    func testUpcomingMoviesArrayAfterFetching() {
        
        mockUpcomingMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .upComing, showFirstPage: false)

        XCTAssertTrue(homeViewModel?.upcomingMovies.count == 2)
    }
    
    //Here we test if we set the movies fetched into the upcoming movies array
    func testUpcomingMoviesArray() {
        
        mockUpcomingMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .upComing, showFirstPage: false)

        XCTAssertEqual(homeViewModel?.upcomingMovies, moviesMockResponse.movies)
    }
    
    //Here we test that alert is not showed when fetch is success
    func testNoShowAlertAfterSuccessFecthUpcomingMovies() {
        
        mockUpcomingMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .upComing)
        
        XCTAssertTrue(homeViewModel?.showAlert == false)
    }
    
    // We test if the last item of Upcoming movies array is displayed
    func testLastItemArrayUpcoming() {
        
        mockUpcomingMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .upComing)
        XCTAssertTrue(homeViewModel.loadMoreMovies(for: .upComing, movie: moviesMockResponse.movies!.last!))
    }
    
    // We test if the last item of Upcoming movies array is displayed
    func testNotLastItemArrayUpcoming() {
        
        mockPopularMovieWorker.successFetch = true
        homeViewModel?.loadMovies(by: .popular)
        
        XCTAssertFalse(homeViewModel.loadMoreMovies(for: .upComing, movie: moviesMockResponse.movies!.first!))
    }
    
    //MARK:- NowPlaying movies related test
    
    //Here we test if the nowPlaying array is empty
    func testNowPlayingMoviesArrayEmpty() {
        
        mockNowPlayingMoviesWorker.successFetch = false
        homeViewModel?.loadMovies(by: .nowPlaying)
        
        XCTAssertTrue(homeViewModel?.nowPlayingMovies.count == 0)
    }

    //Here we test if we show the alert after fetch failed
    func testShowAlertAfterNowPlayingFetchFail() {
        
        mockNowPlayingMoviesWorker.successFetch = false
        homeViewModel?.loadMovies(by: .nowPlaying)
        
        XCTAssertTrue(homeViewModel?.showAlert == true)
    }
    
    //Here we test if we set the movies fetched into the upcoming movies array
    func testNowPlayingMoviesArrayAfterFetching() {
        
        mockNowPlayingMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .nowPlaying, showFirstPage: false)

        XCTAssertTrue(homeViewModel?.nowPlayingMovies.count == 2)
    }
    
    //Here we test if we set the movies fetched into the nowPlaying movies array
    func testNowPlayingMoviesArray() {
        
        mockNowPlayingMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .nowPlaying, showFirstPage: false)

        XCTAssertEqual(homeViewModel?.nowPlayingMovies, moviesMockResponse.movies)
    }
    
    //Here we test that alert is not showed when fetch is success
    func testNoShowAlertAfterSuccessFecthNowPlayingMovies() {
        
        mockNowPlayingMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .nowPlaying)
        
        XCTAssertTrue(homeViewModel?.showAlert == false)
    }
    
    // We test if the last item of NowPlaying movies array is displayed
    func testLastItemArrayNowPlaying() {
        
        mockNowPlayingMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .nowPlaying)
        XCTAssertTrue(homeViewModel.loadMoreMovies(for: .nowPlaying, movie: moviesMockResponse.movies!.last!))
    }
    
    // We test if the last item of Upcoming movies array is displayed
    func testNotLastItemArrayNowPlaying() {
        
        mockNowPlayingMoviesWorker.successFetch = true
        homeViewModel?.loadMovies(by: .nowPlaying)
        
        XCTAssertFalse(homeViewModel.loadMoreMovies(for: .nowPlaying, movie: moviesMockResponse.movies!.first!))
    }
}
