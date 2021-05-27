//
//  DetailMovieViewModel.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 27/5/21.
//

import Combine

class MovieDetailViewModel: ObservableObject {
    
    private let castingWorker = CastingWorker()
    
    var titleAlert = ""
    var messageAlert = ""
    var fetchCastingMovie = true
    
    @Published var casting = [CastMovieResponse.Cast]()
    @Published var showAlert = false
    @Published var showLoader = true
    
    func getMovieCasting(movieId: Int) {
        
        if fetchCastingMovie {
            showLoader = true
            
            castingWorker.getMovieCasting(movieId: movieId) { [weak self] (success, response) in
               
                guard let self = self else {return}
                
                self.showLoader = false
                
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
            }
        }
    }
    
    private func setupAlert(title: String, message: String) {
        self.titleAlert = title
        self.messageAlert = message
        self.showAlert = true
    }
}
