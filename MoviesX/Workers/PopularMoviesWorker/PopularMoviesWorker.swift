//
//  PopularMovies.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import UIKit

protocol FetchPopularMoviesProtocol {
    func getPopularMovies(page: Int, completion: @escaping (Bool, MoviesResponse?) -> Void)
}
class PopularMoviesWorker: BaseWorker, FetchPopularMoviesProtocol {
   
    func getPopularMovies(page: Int, completion: @escaping (Bool, MoviesResponse?) -> Void) {
        
        let headerConfig = SetupRequestWorker.HeadersContentConfig()
        let popularMoviesURL = backendUrlWorkerObj.getPopularMoviesURL()
                
        let queryParameters = [URLQueryItem(name: "api_key", value: apiKey),
                               URLQueryItem(name: "language", value: "en-US"),
                               URLQueryItem(name: "page", value: "\(page)")]

        let request = self.setupRequestWorkerObj.setupUrlQueryRequest(headerConfig: headerConfig,
                                                                      queryParameters: queryParameters,
                                                                      mainUrl: popularMoviesURL, selectedHttpMethod: .GET)
        
        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletion(response, data, error, completion: completion)
        }).resume()
    }    
}
