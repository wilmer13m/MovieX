//
//  MockCastingWorker.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

@testable import MoviesX

class MockCastingWorker: BaseWorker, FetchCastingMoviesProtocol {
    
    var successFetch: Bool = true

    func getMovieCasting(movieId: Int, completion: @escaping (Bool, CastMovieResponse?) -> Void) {
        
        if successFetch {
            completion(true, castMovieResponseMock)
        } else {
            completion(false, nil)
        }
    }
}

let castMovieResponseMock = CastMovieResponse(id: 1,
                          cast: [CastMovieResponse.Cast(adult: true,
                                                               gender: 2,
                                                               id: 444,
                                                               knownForDepartment: "Actor",
                                                               name: "Wilmer Mendoza",
                                                               popularity: 4.9,
                                                               profilePath: nil,
                                                               castId: 44,
                                                               character: "Saul",
                                                               creditId: "12",
                                                               order: 0),
                                 
                                 CastMovieResponse.Cast(adult: true,
                                                        gender: 1,
                                                        id: 444,
                                                        knownForDepartment: "Actress",
                                                        name: "Carol Smith",
                                                        popularity: 3.9,
                                                        profilePath: nil,
                                                        castId: 44,
                                                        character: "Alexa",
                                                        creditId: "12",
                                                        order: 0)],
                          crew: nil)
