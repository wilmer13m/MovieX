//
//  ImagesWorkerTest.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import XCTest
@testable import MoviesX

class ImagesWorkerTest: XCTestCase {

    private let mockSuccessImagesResponse = """
    {
        "id": 50,
        "backdrops": [],
        "posters": []
    }
    """
    var session: MockUrlSession!
    var worker: ImagesWorker!

    override func setUp() {
        super.setUp()
        
        session = MockUrlSession()
        worker = ImagesWorker(session: session)
    }

    override func tearDown() {
        
        session = nil
        worker = nil
        
        super.tearDown()
    }
    
    func testSuccessImages() {

        let data = Data(self.mockSuccessImagesResponse.utf8)
        session.nextData = data
        let url = URL(string: worker.backendUrlWorkerObj.getImagesFromMovieURL(movieId: "2"))
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: ImagesMovieResponse?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getImagesFromMovie(movieId: 2) { (success, imagesMovieResponse) in
            successResponse = success
            response = imagesMovieResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertTrue(response != nil)
    }
    
    func testFailFetchImages() {

        let url = URL(string: worker.backendUrlWorkerObj.getImagesFromMovieURL(movieId: "2"))
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: ImagesMovieResponse?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getImagesFromMovie(movieId: 2) { (success, imagesMovieResponse) in
            successResponse = success
            response = imagesMovieResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }
}

