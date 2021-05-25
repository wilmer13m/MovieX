//
//  TopRatedMoviesWorker.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import UIKit

class TopRatedMoviesWorker: BaseWorker {

    func getTopRatedMovies(page: Int, completion: @escaping (Bool, Movie?) -> Void) {
        
        let headerConfig = SetupRequestWorker.HeadersContentConfig()
        let popularMoviesURL = backendUrlWorkerObj.getTopRatedMoviesURL()
                
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
