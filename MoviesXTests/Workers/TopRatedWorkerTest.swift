//
//  TopRatedWorker.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import XCTest
@testable import MoviesX

class TopRatedWorkerTest: XCTestCase {

    private let mockSuccessMoviesResponse = """
    {
        "page": 1,
        "results": [
            {
                "adult": false,
                "backdrop_path": "/wwFBRyekDcKXJwP0mImRJjAnudL.jpg",
                "genre_ids": [
                    27
                ],
                "id": 632357,
                "original_language": "en",
                "original_title": "The Unholy",
                "overview": "Alice, a young hearing-impaired girl who, after a supposed visitation from the Virgin Mary, is inexplicably able to hear, speak and heal the sick. As word spreads and people from near and far flock to witness her miracles, a disgraced journalist hoping to revive his career visits the small New England town to investigate. When terrifying events begin to happen all around, he starts to question if these phenomena are the works of the Virgin Mary or something much more sinister.",
                "popularity": 3681.658,
                "poster_path": "/b4gYVcl8pParX8AjkN90iQrWrWO.jpg",
                "release_date": "2021-03-31",
                "title": "The Unholy",
                "video": false,
                "vote_average": 7.2,
                "vote_count": 500
            },
            {
                "adult": false,
                "backdrop_path": "/c0izdYdnTe4uMRifHgvTA85wPz0.jpg",
                "genre_ids": [
                    28,
                    27,
                    53
                ],
                "id": 503736,
                "original_language": "en",
                "original_title": "Army of the Dead",
                "overview": "Following a zombie outbreak in Las Vegas, a group of mercenaries take the ultimate gamble: venturing into the quarantine zone to pull off the greatest heist ever attempted.",
                "popularity": 2362.737,
                "poster_path": "/z8CExJekGrEThbpMXAmCFvvgoJR.jpg",
                "release_date": "2021-05-14",
                "title": "Army of the Dead",
                "video": false,
                "vote_average": 6.7,
                "vote_count": 960
            }
        ],
        "total_pages": 500,
        "total_results": 10000
    }
    """
    var session: MockUrlSession!
    var worker: TopRatedMoviesWorker!

    override func setUp() {
        super.setUp()
        
        session = MockUrlSession()
        worker = TopRatedMoviesWorker(session: session)
    }

    override func tearDown() {
        
        session = nil
        worker = nil
        
        super.tearDown()
    }
    
    func testSuccessTopRatedMovies() {

        let data = Data(self.mockSuccessMoviesResponse.utf8)
        session.nextData = data
        let url = URL(string: worker.backendUrlWorkerObj.getTopRatedMoviesURL())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: MoviesResponse?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getTopRatedMovies(page: 1) { (success, moviesResponse) in
            successResponse = success
            response = moviesResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertTrue(!response!.movies!.isEmpty)
        XCTAssertTrue(response!.movies![1].id == 503736)

    }
    
    func testFailTopRatedMovies() {

        let url = URL(string: worker.backendUrlWorkerObj.getNowPlayingMoviesURL())
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: MoviesResponse?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getTopRatedMovies(page: 1) { (success, moviesResponse) in
            successResponse = success
            response = moviesResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }

}
