//
//  URLSessionDataTaskMock.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import UIKit

@testable import MoviesX

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {

    private (set) var resumeWasCalled = false

    func resume() {
        resumeWasCalled = true

    }
}
