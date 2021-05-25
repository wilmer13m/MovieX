//
//  BackendURLWorker.swift
//  Pinkcar&Procar
//
//  Created by Javier Susa on 28/09/20.
//

import Foundation
import SwiftUI

class BackendURLWorker {

    // MARK: Variable name for the main API URL
    private let apiUrlVariableName = "Api Main URL"

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
    
    // MARK: Gets the full endpoint for go login
    func getNowPlayingMoviesURL() -> String {
        return getVariableFromPlist(variableName: apiUrlVariableName) + nowPlayingMoviesSubDomain
    }
}