//
//  HomeViewModel.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 25/5/21.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    private let popularWorker = PopularMoviesWorker()
    private let topRatedWorker = TopRatedMoviesWorker()
    private let upComingWorker = UpcomingWorker()
    private let nowPlayingWorker = NowPlayingMoviesWorker()

    var titleAlert = ""
    var messageAlert = ""
    var pagePopular: Int = 0
    var pageTopRated: Int = 0
    var pageUpcoming: Int = 0
    var pageNowplaying: Int = 0

    @Published var popularMovies = [MoviesResponse.Movie]()
    @Published var topRatedMovies = [MoviesResponse.Movie]()
    @Published var upcomingMovies = [MoviesResponse.Movie]()
    @Published var nowPlayingMovies = [MoviesResponse.Movie]()

    @Published var showAlert = false
    @Published var showLoader = false
    @Published var loadInitialData = true
    @Published var selection = 0
    
    /// This function fetch a movie array for a given `MovieType`.
 
    /// - Warning: This could return a nil array or an empty array
    /// - Parameter type: The movie type that you want to fetch, this is an enum
    /// - Parameter showFirstPage: assign true if you want to fetch the first page

    func loadMovies(by type: MovieType, showFirstPage: Bool = false) {
       
        showLoader = true
        
        switch type {
        
        case .popular:
            
            if loadInitialData {
                loadInitialData = false
            }
            
            if showFirstPage {
                //Restart previous data
                popularMovies = []
                pagePopular = 1
            } else {
                pagePopular += 1
            }
            
            popularWorker.getPopularMovies(page: pagePopular) { [weak self] (success, moviesInfo) in
              
                guard let self = self else {return}
                
                self.showLoader = false
                
                if success {
                    
                    guard let movies = moviesInfo?.movies, !movies.isEmpty else {
                    self.setupAlert(title: "moviex_error".localized(), message: "home_alert_no_movies_movies_message".localized())
                        return
                    }
                    
                    DispatchQueue.main.async {
                        movies.forEach { (movie) in
                            self.popularMovies.append(movie)
                        }
                    }
                } else {
                    self.setupAlert(title: "moviex_error".localized(), message: "home_alert_no_movies_movies_message".localized())
                }
            }

        case .topRated:
            
            if showFirstPage {
                //Restart previous data
                topRatedMovies = []
                pageTopRated = 1
            } else {
                pageTopRated += 1
            }
            
            topRatedWorker.getTopRatedMovies(page: pageTopRated) { [weak self] (success, moviesInfo) in
                
                guard let self = self else {return}
                self.showLoader = false
                if success {
                    
                    guard let movies = moviesInfo?.movies, !movies.isEmpty else {
                        self.setupAlert(title: "moviex_error".localized(), message: "home_alert_no_movies_movies_message".localized())
                        return
                    }
                    
                    DispatchQueue.main.async {
                        movies.forEach { (movie) in
                            self.topRatedMovies.append(movie)
                        }
                    }
                    
                } else {
                    self.setupAlert(title: "moviex_error".localized(), message: "home_alert_no_movies_movies_message".localized())
                }
            }
        case .upComing:
            
            if showFirstPage {
                //Restart previous data
                upcomingMovies = []
                pageUpcoming = 1
            } else {
                pageUpcoming += 1
            }
                        
            upComingWorker.getUpcomingMovies(page: pageUpcoming) { [weak self] (success, moviesInfo) in
                
                guard let self = self else {return}
                self.showLoader = false

                if success {
                    
                    guard let movies = moviesInfo?.movies, !movies.isEmpty else {
                        self.setupAlert(title: "moviex_error".localized(), message: "home_alert_no_movies_movies_message".localized())
                        return
                    }
                    
                    DispatchQueue.main.async {
                        movies.forEach { (movie) in
                            self.upcomingMovies.append(movie)
                        }
                    }
                } else {
                    self.setupAlert(title: "moviex_error".localized(), message: "home_alert_no_movies_movies_message".localized())
                }
            }
            
        case .nowPlaying:
            
            if showFirstPage {
                //Restart previous data
                nowPlayingMovies = []
                pageNowplaying = 1
            } else {
                pageNowplaying += 1
            }

            nowPlayingWorker.getNowPlayingMovies(page: pageNowplaying) { [weak self] (success, moviesInfo) in
                
                guard let self = self else {return}
                self.showLoader = false

                if success {
                    
                    guard let movies = moviesInfo?.movies, !movies.isEmpty else {
                        self.setupAlert(title: "moviex_error".localized(), message: "home_alert_no_movies_movies_message".localized())
                        return
                    }
                    
                    DispatchQueue.main.async {
                        movies.forEach { (movie) in
                            self.nowPlayingMovies.append(movie)
                        }
                    }
                    
                } else {
                    self.setupAlert(title: "moviex_error".localized(), message: "home_alert_no_movies_movies_message".localized())
                }
            }
        }
    }
    
    /// This function check if we need to fetch more movies of a specifec type.
 
    /// - Parameter movieType: The movie type that you want to fetch, this is an enum
    /// - Parameter movie: the item that we use to compare and decide y we need to fetch more movies
    /// - Returns: True if we send the last item previously fetched

    func loadMoreMovies(for movieType: MovieType, movie: MoviesResponse.Movie) -> Bool {
        
        switch movieType {
        case .popular:
            guard let lastMovieInArray = popularMovies.last else {return false}
            return lastMovieInArray == movie
        case .topRated:
            guard let lastMovieInArray = topRatedMovies.last else {return false}
            return lastMovieInArray == movie

        case .upComing:
            guard let lastMovieInArray = upcomingMovies.last else {return false}
            return lastMovieInArray == movie

        case .nowPlaying:
            guard let lastMovieInArray = nowPlayingMovies.last else {return false}
            return lastMovieInArray == movie
        }
    }
    
    /// This function setup the data to use in the alert.
 
    /// - Parameter title: title to display in the alert
    /// - Parameter movie: message to display in alert

    private func setupAlert(title: String, message: String) {
        self.titleAlert = title
        self.messageAlert = message
        self.showAlert = true
    }
}
