//
//  MockPopularMoviesWorker.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 26/5/21.
//

@testable import MoviesX

class MockPopularMoviesWorker: BaseWorker, FetchPopularMoviesProtocol {
  
    var successFetch: Bool = true
    
    func getPopularMovies(page: Int, completion: @escaping (Bool, MoviesResponse?) -> Void) {
        
        if successFetch {
            completion(true, moviesMockResponse)
        } else {
            completion(false, nil)
        }
    }
}

let moviesMockResponse = MoviesResponse(page: 1,
                                               movies: [MoviesResponse.Movie(adult: false, backdropPath: "/6ELCZlTA5lGUops70hKdB83WJxH.jpg", genreIds: [28, 14, 12], id: 460465, originalLanguage: "en", originalTitle: "Mortal Kombat", overview: "Washed-up MMA fighter Cole Young, unaware of his heritage, and hunted by Emperor Shang Tsung's best warrior, Sub-Zero, seeks out and trains with Earth's greatest champions as he prepares to stand against the enemies of Outworld in a high stakes battle for the universe.", popularity: 1885.224, posterPath: "/nkayOAUBUu4mMvyNf9iHSUiPjF1.jpg", releaseDate: "2021-04-07", title: "Mortal Kombat", video: false, voteAverage: 7.6, voteCount: 2000),
                                                        MoviesResponse.Movie(adult: false, backdropPath: "/6ELCZlTA5lGUops70hKdB83WJxH.jpg", genreIds: [28, 14, 12], id: 460464, originalLanguage: "en", originalTitle: "Mortal Kombat", overview: "Washed-up MMA fighter Cole Young, unaware of his heritage, and hunted by Emperor Shang Tsung's best warrior, Sub-Zero, seeks out and trains with Earth's greatest champions as he prepares to stand against the enemies of Outworld in a high stakes battle for the universe.", popularity: 1885.224, posterPath: "/nkayOAUBUu4mMvyNf9iHSUiPjF1.jpg", releaseDate: "2021-04-07", title: "Mortal Kombat", video: false, voteAverage: 7.6, voteCount: 2000)],
                                               totalPages: 4,
                                               totalResults: 100)

