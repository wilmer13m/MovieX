//
//  PersonDetail.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import Foundation

struct PersonDetail: Codable {
    
    var birthday: String?
    var knownForDepartment: String?
    var deathday: String?
    var id: Int?
    var name: String?
    var alsoKnownAs: [String]?
    var gender: Int?
    var biography: String?
    var popularity: Double?
    var place_of_birth: String?
    var placeOfBirth: String?
    var adult: Bool?
    var imdbId: String?
    var homepage: String?
    
    private enum CodingKeys: String, CodingKey {
        case birthday, deathday, id, name, gender, biography, popularity, adult, homepage
        case knownForDepartment = "known_for_department"
        case alsoKnownAs = "also_known_as"
        case placeOfBirth = "place_of_birth"
        case imdbId = "imdb_id"
    }
}
