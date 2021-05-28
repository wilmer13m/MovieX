//
//  ProfileTest.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import XCTest
@testable import MoviesX

class ProfileTest: XCTestCase {

    var profileViewModel: ProfileViewModel!
    var mockPersonDetailWorker: MockPersonDetailWorker!
    
    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        mockPersonDetailWorker = MockPersonDetailWorker()
        profileViewModel = ProfileViewModel(personDetailWorker: mockPersonDetailWorker)
    }
    
    override func tearDown() {
        
        profileViewModel = nil
        mockPersonDetailWorker = nil
        super.tearDown()
    }

    //Here we test if the personDetail var is not nil after fecth success
    func testPersonDetail() {
        
        mockPersonDetailWorker.successFetch = true
        profileViewModel?.getProfileDetail(personId: 1)
        XCTAssertNotNil(profileViewModel?.personDetail)
    }

    //Here we test if the personDetail var is nil after fecth failed
    func testPersonDetailFetchFail() {
        
        mockPersonDetailWorker.successFetch = false
        profileViewModel?.getProfileDetail(personId: 1)

        XCTAssertNil(profileViewModel?.personDetail)
    }
    
    //Here we test if we show the alert after fetch failed
    func testShowAlertAfterFetchFail() {
        
        mockPersonDetailWorker.successFetch = false
        profileViewModel?.getProfileDetail(personId: 1)

        XCTAssertTrue(profileViewModel?.showAlert == true)
    }
}
