//
//  Movie.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import Foundation

struct Movie: Codable {
    
    var page: Int?
    var results: [Result]?
    var totalPages: Int?
    var totalResults: Int?

    private enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    struct Result: Codable {
        
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
    }
}
