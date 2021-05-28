//
//  ImagesMovieResponse.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import Foundation

struct ImagesMovieResponse: Codable {
    
    var id: Int?
    var backdrops: [Images]?
    var posters: [Images]?
    
    struct Images: Codable {
        var id = UUID()
        var aspectRatio: Double?
        var filePath: String?
        var height: Int?
        var iso_639_1: String?
        var voteAverage: Double?
        var voteCount: Int?
        var width: Int?
        
        private enum CodingKeys: String, CodingKey {
            case height
            case aspectRatio = "aspect_ratio"
            case filePath = "file_path"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
    }
}
