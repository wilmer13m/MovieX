//
//  ImagesMovie.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import Foundation

struct MovieImages: Codable {
    
    var id: Int?
    var backdrops: [MovieImages.Backdrops]?
    var posters: [MovieImages.Posters]?

    struct Backdrops: Codable {
        
        var aspectRatio: Double?
        var filePath: String?
        var height: Int?
        var iso6391: String?
        var voteAverage: Int?
        var voteCount: Int?
        var width: Int?
    
        private enum CodingKeys: String, CodingKey {
            case height, width
            case aspectRatio = "aspect_ratio"
            case filePath = "file_path"
            case iso6391 = "iso_639_1"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
    
    struct Posters: Codable {
        var aspectRatio: Double?
        var filePath: String?
        var height: Int?
        var iso6391: String?
        var voteAverage: Int?
        var voteCount: Int?
        var width: Int?

        private enum CodingKeys: String, CodingKey {
            case height, width
            case aspectRatio = "aspect_ratio"
            case filePath = "file_path"
            case iso6391 = "iso_639_1"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
}
