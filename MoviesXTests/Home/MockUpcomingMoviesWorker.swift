//
//  MockUpcomingWorker.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 27/5/21.
//

@testable import MoviesX

class MockUpcomingMoviesWorker: FetchUpcomingMoviesProtocol {
    
    var successFetch: Bool = true

    func getUpcomingMovies(page: Int, completion: @escaping (Bool, MoviesResponse?) -> Void) {
        
        if successFetch {
            completion(true, moviesMockResponse)
        } else {
            completion(false, nil)
        }
    }
}
