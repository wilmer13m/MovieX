//
//  MoviesCreditsWorkerTest.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import XCTest
@testable import MoviesX

class MoviesCreditsWorkerTest: XCTestCase {

    private let mockSuccessMovieCreditsResponse = """
    {
        "id": 632357,
        "cast": [
            {
                "adult": false,
                "gender": 2,
                "id": 47296,
                "known_for_department": "Acting",
                "name": "Jeffrey Dean Morgan",
                "original_name": "Jeffrey Dean Morgan",
                "popularity": 19.874,
                "profile_path": "/s0YlYSyLizIQ84qiUBa86mi2fGE.jpg",
                "cast_id": 1,
                "character": "Gerry Fenn",
                "credit_id": "5d82f979c490480221d189ab",
                "order": 0
            },
            {
                "adult": false,
                "gender": 1,
                "id": 2067034,
                "known_for_department": "Acting",
                "name": "Cricket Brown",
                "original_name": "Cricket Brown",
                "popularity": 7.315,
                "profile_path": "/kYBJ9YItPmbvl3009eKAkvkIlYl.jpg",
                "cast_id": 10,
                "character": "Alice",
                "credit_id": "5e587ce2f48b3400137ad4dd",
                "order": 1
            }
        ],
        "crew": [
            {
                "adult": false,
                "gender": 2,
                "id": 7623,
                "known_for_department": "Directing",
                "name": "Sam Raimi",
                "original_name": "Sam Raimi",
                "popularity": 4.733,
                "profile_path": "/8gssvwiPrFRuFRlr5ruKx68k1Jl.jpg",
                "credit_id": "5d82fa13e04aca0225c30a4a",
                "department": "Production",
                "job": "Producer"
            }
        ]
    }
    """
    var session: MockUrlSession!
    var worker: MovieCreditsWorker!

    override func setUp() {
        super.setUp()
        
        session = MockUrlSession()
        worker = MovieCreditsWorker(session: session)
    }

    override func tearDown() {
        
        session = nil
        worker = nil
        
        super.tearDown()
    }
    
    func testSuccessMovieCredits() {

        let data = Data(self.mockSuccessMovieCreditsResponse.utf8)
        session.nextData = data
        let url = URL(string: worker.backendUrlWorkerObj.getMovieCreditsURL(movieId: "2"))
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: MovieCredits?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getMovieCredits(movieId: 44) { (success, movieCredistsResponse) in
            successResponse = success
            response = movieCredistsResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertTrue(response?.id == 632357)
        XCTAssertTrue(response?.cast?[1].name == "Cricket Brown")
    }
    
    func testFailMovieCredits() {

        let url = URL(string: worker.backendUrlWorkerObj.getImagesFromMovieURL(movieId: "2"))
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: MovieCredits?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getMovieCredits(movieId: 44) { (success, movieCredistsResponse) in
            successResponse = success
            response = movieCredistsResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }

}
