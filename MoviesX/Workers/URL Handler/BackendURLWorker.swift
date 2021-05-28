//
//  BackendURLWorker.swift
//  Pinkcar&Procar
//
//  Created by Wilmer Mendoza on 24/05/21.
//

import Foundation

class BackendURLWorker {

    // MARK: Variable name for the main API URL
    private let apiUrlVariableName = "Api Main URL"

    // MARK: Variable name for the main API URL
    private let apiImageUrlVariableName = "Api Images URL"

    // MARK: Subdomain for login endpoint
    private let loginSubdomain = "login/passenger.json"
    
    // MARK: Subdomain for popular movies endpoint
    private let popularMoviesSubDomain = "3/movie/popular"
    
    // MARK: Subdomain for topRated movies endpoint
    private let topRatedMoviesSubDomain = "3/movie/top_rated"
    
    // MARK: Subdomain for upcoming movies endpoint
    private let upcomingMoviesSubDomain = "3/movie/upcoming"
    
    // MARK: Subdomain for now playing movies endpoint
    private let nowPlayingMoviesSubDomain = "3/movie/now_playing"
    
    // MARK: Subdomain for movie credits endpoint
    private let creditsMovie = "3/movie/%@/credits"
    
    // MARK: Subdomain for movie images endpoint
    private let movieImages = "%@/images"

    // MARK: Subdomain for people detail endpoint
    private let personDetail = "3/person/%@"

    // MARK: Subdomain for movie casting
    private let casting = "3/movie/%@/credits"
    
    // MARK: Subdomain for get images from movie
    private let imagesFromMovie = "3/movie/%@/images"
    
    //MARK: get API URL
    private func getVariableFromPlist(variableName: String) -> String {
        return ((Bundle.main.infoDictionary?[variableName] as? String)?.replacingOccurrences(of: "\\", with: ""))!
    }
 
    // MARK: Gets the full endpoint for go login
    func getGoLoginURL() -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + loginSubdomain
    }
    
    // MARK: Gets the full endpoint for popular movies
    func getPopularMoviesURL() -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + popularMoviesSubDomain
    }
    
    // MARK: Gets the full endpoint for topRated movies
    func getTopRatedMoviesURL() -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + topRatedMoviesSubDomain
    }
    
    // MARK: Gets the full endpoint for upcoming movies
    func getUpcomingMoviesURL() -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + upcomingMoviesSubDomain
    }
    
    // MARK: Gets the full endpoint for now playing movies
    func getNowPlayingMoviesURL() -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + nowPlayingMoviesSubDomain
    }
    
    // MARK: Gets the full endpoint for movie credits
    func getMovieCreditsURL(movieId: String) -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + String(format:
                                                                                creditsMovie,
                                                                            "\(movieId)")
    }
    
    // MARK: Gets the full endpoint for movie images
    func getMovieImagesURL(movieId: String) -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + String(format:
                                                                                movieImages,
                                                                            "\(movieId)")
    }
    
    // MARK: Gets the full endpoint for person detail
    func getPersonDetailURL(personId: String) -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + String(format:
                                                                                personDetail,
                                                                            "\(personId)")
    }
    
    func getBaseImageUrl() -> String {
        getVariableFromPlist(variableName: apiImageUrlVariableName)
    }
    
    // MARK: Gets the full endpoint for movie casting
    func getPersonMovieCastingURL(movieId: String) -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + String(format:
                                                                                casting,
                                                                            "\(movieId)")
    }
    
    // MARK: Gets the full endpoint for movie casting
    func getImagesFromMovieURL(movieId: String) -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + String(format:
                                                                                imagesFromMovie,
                                                                            "\(movieId)")
    }
}
