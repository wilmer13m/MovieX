//
//  Movie.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import Foundation

struct MoviesResponse: Codable {
    
    var page: Int?
    var movies: [Movie]? //original node is results
    var totalPages: Int?
    var totalResults: Int?

    private enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    struct Movie: Codable, Equatable {
        
        var adult: Bool?
        var backdropPath: String?
        var genreIds: [Int]?
        var id: Int?
        var originalLanguage: String?
        var originalTitle: String?
        var overview: String?
        var popularity: Double?
        var posterPath: String?
        var releaseDate: String?
        var title: String?
        var video: Bool?
        var voteAverage: Double?
        var voteCount: Int
        
        private enum CodingKeys: String, CodingKey {
            case adult, id, overview, popularity, title
            case backdropPath = "backdrop_path"
            case genreIds = "genre_ids"
            case originalLanguage = "original_language"
            case posterPath = "poster_path"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case originalTitle = "original_title"
            case releaseDate = "release_date"
        }
        
        static func ==(lhs: Movie, rhs: Movie) -> Bool {
            return lhs.id == rhs.id
        }
    }
}

let movieDebug = MoviesResponse.Movie(adult: false,
                                      backdropPath: "/iDdpiUnCeXvBmrkBFpL6lKsZt33.jpg",
                                      genreIds: [53,
                                                 18,
                                                 28,
                                                 9648],
                                      id: 578701,
                                      originalLanguage: "en",
                                      originalTitle: "Those Who Wish Me Dead",
                                      overview: "A young boy finds himself pursued by two assassins in the Montana wilderness with a survival expert determined to protecting him - and a forest fire threatening to consume them all.",
                                      popularity: 1932.947,
                                      posterPath: "/xCEg6KowNISWvMh8GvPSxtdf9TO.jpg",
                                      releaseDate: "2021-05-05",
                                      title: "Those Who Wish Me Dead",
                                      video: false,
                                      voteAverage: 7.1,
                                      voteCount: 280)

