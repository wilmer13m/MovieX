//
//  CastMovieResponse.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 27/5/21.
//

import Foundation

struct CastMovieResponse: Codable {
    var id: Int?
    var cast: [CastMovieResponse.Cast]?
    var crew: [CastMovieResponse.Crew]?
    
    struct Cast: Codable, Equatable {
        var adult: Bool?
        var gender: Int?
        var id: Int?
        var knownForDepartment: String?
        var name: String?
        var popularity: Double?
        var profilePath: String?
        var castId: Int?
        var character: String?
        var creditId: String?
        var order: Int?
        
        private enum CodingKeys: String, CodingKey {
            case adult, gender, id, name, popularity, character, order
            case knownForDepartment = "known_for_department"
            case profilePath = "profile_path"
            case castId = "cast_id"
            case creditId = "credit_id"
        }
        
        static func ==(lhs: Cast, rhs: Cast) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    struct Crew: Codable {
        var adult: Bool?
        var gender: Int?
        var id: Int?
        var knownForDepartment: String?
        var name: String?
        var popularity: Double?
        var profilePath: String?
        var creditId: String?
        var department: String?
        var job: String?
        
        private enum CodingKeys: String, CodingKey {
            case adult, gender, id, name, popularity, job, department
            case knownForDepartment = "known_for_department"
            case profilePath = "profile_path"
            case creditId = "credit_id"
        }
    }
}
