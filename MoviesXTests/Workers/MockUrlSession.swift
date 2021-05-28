//
//  MockUrlSession.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import Foundation

@testable import MoviesX

class MockUrlSession: URLSessionProtocol {
    
    var nextDataTask = URLSessionDataTaskMock()
    var nextData: Data?
    var nextResponse: URLResponse?
    var nextError: Error?

    private (set) var lastURL: URL?

    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = request.url
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
    

}
