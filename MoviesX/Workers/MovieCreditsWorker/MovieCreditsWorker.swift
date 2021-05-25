//
//  CreditsMovieWorker.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import UIKit

class MovieCreditsWorker: BaseWorker {

    func getMovieCredits(movieId: Int, completion: @escaping (Bool, MovieCredits?) -> Void) {
        
        let headerConfig = SetupRequestWorker.HeadersContentConfig()
        let popularMoviesURL = backendUrlWorkerObj.getMovieCreditsURL(movieId: "\(movieId)")
                
        let queryParameters = [URLQueryItem(name: "api_key", value: apiKey),
                               URLQueryItem(name: "language", value: "en-US")]

        let request = self.setupRequestWorkerObj.setupUrlQueryRequest(headerConfig: headerConfig,
                                                                      queryParameters: queryParameters,
                                                                      mainUrl: popularMoviesURL, selectedHttpMethod: .GET)
        
        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletion(response, data, error, completion: completion)
        }).resume()
    }
}
