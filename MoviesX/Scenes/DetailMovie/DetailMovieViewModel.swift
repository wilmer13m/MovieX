//
//  DetailMovieViewModel.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 27/5/21.
//


import Combine

class MovieDetailViewModel: ObservableObject {
    
    private let castingWorker: FetchCastingMoviesProtocol
    private let imagesWorker: FetchImagesWorkerProtocol
    
    var titleAlert = ""
    var messageAlert = ""
    var fetchCastingMovie = true
    
    @Published var casting = [CastMovieResponse.Cast]()
    @Published var images = [ImagesMovieResponse.Images]()
    @Published var showAlert = false
    @Published var showLoader = true

    init(castingWorker: FetchCastingMoviesProtocol = CastingWorker(),
         imagesWorker: FetchImagesWorkerProtocol = ImagesWorker()) {
        self.castingWorker = castingWorker
        self.imagesWorker = imagesWorker
    }
    
    
    /// This function fetch all casting from a movie given a `movieId`.
 
    /// - Parameter movieId: The movie id

    func getMovieCasting(movieId: Int) {
        
        if fetchCastingMovie {
            showLoader = true
            
            castingWorker.getMovieCasting(movieId: movieId) { [weak self] (success, response) in
               
                guard let self = self else {return}
                                
                if success {
                    
                    guard let cast = response?.cast, !cast.isEmpty else {
                        self.setupAlert(title: "moviex_error".localized(), message: "movie_detail_no_available_cast_info".localized())
                        return
                    }
                    
                    self.fetchCastingMovie = false
                    self.casting = cast
                    
                } else {
                    self.setupAlert(title: "moviex_error".localized(), message: "movie_failed_connection".localized())
                }
                
                self.getImages(movieId: movieId)
            }
        }
    }
    
    /// This function fetch all images from a movie given a `movieId`.
 
    /// - Parameter movieId: The movie id

    func getImages(movieId: Int) {
        
        imagesWorker.getImagesFromMovie(movieId: movieId) { [weak self] (success, response) in
               
            guard let self = self else {return}
                
            self.showLoader = false
                
            if success {
                    
                guard let imagesArray = response?.posters, !imagesArray.isEmpty else {
                    return
                }
                    
                self.fetchCastingMovie = false
                self.images = imagesArray
            }
        }
    }
    
    /// This function set the alert.
 
    /// - Parameter title: text to display in the title alert
    /// - Parameter message: text to display in the message alert
    private func setupAlert(title: String, message: String) {
        self.titleAlert = title
        self.messageAlert = message
        self.showAlert = true
    }
}
