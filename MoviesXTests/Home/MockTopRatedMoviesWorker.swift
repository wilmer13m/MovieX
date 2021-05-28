//
//  MockTopRatedMoviesWorker.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 27/5/21.
//

@testable import MoviesX

class MockTopRatedMoviesWorker: FetchTopRatedMoviesProtocol {
    
    var successFetch: Bool = true
    
    func getTopRatedMovies(page: Int, completion: @escaping (Bool, MoviesResponse?) -> Void) {
        if successFetch {
            completion(true, moviesMockResponse)
        } else {
            completion(false, nil)
        }
    }
}
