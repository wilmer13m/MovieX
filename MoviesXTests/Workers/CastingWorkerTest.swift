//
//  CastingWorkerTest.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import XCTest
@testable import MoviesX

class CastingWorkerTest: XCTestCase {

    private let mockSuccessCastingResponse = """
    {
        "id": 460465,
        "cast": [
            {
                "adult": false,
                "gender": 2,
                "id": 1610940,
                "known_for_department": "Acting",
                "name": "Lewis Tan",
                "original_name": "Lewis Tan",
                "popularity": 8.819,
                "profile_path": "/lkW8gh20BuwzHecXqYH1eRVuWpb.jpg",
                "cast_id": 23,
                "character": "Cole Young",
                "credit_id": "5d647aaebcf8c9001575e2c1",
                "order": 0
            },
            {
                "adult": false,
                "gender": 1,
                "id": 136347,
                "known_for_department": "Acting",
                "name": "Jessica McNamee",
                "original_name": "Jessica McNamee",
                "popularity": 11.735,
                "profile_path": "/aAfaMEEqD8syHv5bLi5B3sccrM2.jpg",
                "cast_id": 24,
                "character": "Sonya Blade",
                "credit_id": "5d647b30bcf8c9001475e363",
                "order": 1
            }
        ]
    }
    """
    var session: MockUrlSession!
    var worker: CastingWorker!

    override func setUp() {
        super.setUp()
        
        session = MockUrlSession()
        worker = CastingWorker(session: session)
    }

    override func tearDown() {
        
        session = nil
        worker = nil
        
        super.tearDown()
    }
    
    func testSuccessCastingInfo() {

        let data = Data(self.mockSuccessCastingResponse.utf8)
        session.nextData = data
        let url = URL(string: worker.backendUrlWorkerObj.getImagesFromMovieURL(movieId: "2"))
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: CastMovieResponse?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getMovieCasting(movieId: 439) { (success, castMovieResponse) in
            successResponse = success
            response = castMovieResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertTrue(response?.id == 460465)
    }
    
    func testFailCastInfo() {

        let url = URL(string: worker.backendUrlWorkerObj.getImagesFromMovieURL(movieId: "2"))
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: CastMovieResponse?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getMovieCasting(movieId: 439) { (success, castMovieResponse) in
            successResponse = success
            response = castMovieResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }
}
