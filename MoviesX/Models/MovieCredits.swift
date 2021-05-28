//
//  CreditsMovie.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import UIKit

struct MovieCredits: Codable {
    var id: Int?
    var cast: [MovieCredits.Cast]?
    var crew: [MovieCredits.Crew]?
    
    struct Cast: Codable {
        var adult: Bool?
        var gender: Int?
        var id: Int?
        var knownForDepartment: String?
        var name: String?
        var originalName: String?
        var popularity: Double?
        var profilePath: String?
        var castId: Int?
        var character: String?
        var creditId: String?
        var order: Int?
        
        private enum CodingKeys: String, CodingKey {
            case adult, gender, id, name, popularity, character, order
            case knownForDepartment = "known_for_department"
            case originalName = "original_name"
            case profilePath = "profile_path"
            case castId = "cast_id"
            case creditId = "credit_id"
        }
    }
    
    struct Crew: Codable {
        
        var adult: Bool?
        var gender: Int?
        var id: Int?
        var knownForDepartment: String?
        var name: String?
        var originalName: String?
        var popularity: Double?
        var profilePath: String?
        var creditId: String?
        var department: String?
        var job: String?
        
        private enum CodingKeys: String, CodingKey {
            case adult, gender, id, name, popularity, department, job
            case knownForDepartment = "known_for_department"
            case originalName = "original_name"
            case profilePath = "profile_path"
            case creditId = "credit_id"
        }
    }
}
