//
//  PersonDeailWorkerTest.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import XCTest
@testable import MoviesX

class PersonDeailWorkerTest: XCTestCase {

    private let mockSuccessPersonDetailResponse = """
    {
        "adult": false,
        "also_known_as": [
            " Edward Harrison ",
            "Ed Norton",
            "爱德华·诺顿",
            "เอ็ดเวิร์ด นอร์ตัน",
            "Эдвард Нортон",
            "エドワード・ノートン",
            "إدوارد نورتون",
            "에드워드 노튼",
            "Έντουαρντ Νόρτον",
            "Edward Harrison Norton"
        ],
        "biography": "Edward Harrison Norton...",
        "deathday": null,
        "gender": 2,
        "homepage": null,
        "id": 819,
        "imdb_id": "nm0001570",
        "known_for_department": "Acting",
        "name": "Edward Norton",
        "place_of_birth": "Boston, Massachusetts, USA",
        "popularity": 5.618,
        "profile_path": "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg"
    }
    """
    var session: MockUrlSession!
    var worker: PersonDetailWorker!

    override func setUp() {
        super.setUp()
        
        session = MockUrlSession()
        worker = PersonDetailWorker(session: session)
    }

    override func tearDown() {
        
        session = nil
        worker = nil
        
        super.tearDown()
    }
    
    func testSuccessPersonDetail() {

        let data = Data(self.mockSuccessPersonDetailResponse.utf8)
        session.nextData = data
        let url = URL(string: worker.backendUrlWorkerObj.getImagesFromMovieURL(movieId: "2"))
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 200, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: PersonDetail?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getPersonDetail(personId: 44) { (success, personDetailMovieResponse) in
            successResponse = success
            response = personDetailMovieResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertTrue(successResponse!)
        XCTAssertTrue(response?.id == 819)
        XCTAssertNil(response?.deathday)
    }
    
    func testFailPersonDetail() {

        let url = URL(string: worker.backendUrlWorkerObj.getImagesFromMovieURL(movieId: "2"))
        session.nextResponse = HTTPURLResponse(url: url!, statusCode: 400, httpVersion: "2.0", headerFields: nil)

        var successResponse: Bool?
        var response: PersonDetail?
        let exp = self.expectation(description: "Waiting for blocking")

        worker.getPersonDetail(personId: 44) { (success, personDetailMovieResponse) in
            successResponse = success
            response = personDetailMovieResponse
            exp.fulfill()
        }

        self.waitForExpectations(timeout: 10)

        XCTAssertFalse(successResponse!)
        XCTAssertNil(response)
    }
}
