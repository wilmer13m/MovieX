//
//  CastingWorker.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 27/5/21.
//

import Foundation

protocol FetchCastingMoviesProtocol {
    func getMovieCasting(movieId: Int, completion: @escaping (Bool, CastMovieResponse?) -> Void)
}
class CastingWorker: BaseWorker, FetchCastingMoviesProtocol {

    func getMovieCasting(movieId: Int, completion: @escaping (Bool, CastMovieResponse?) -> Void) {
        
        let headerConfig = SetupRequestWorker.HeadersContentConfig()
        let personDetailURL = backendUrlWorkerObj.getPersonMovieCastingURL(movieId: "\(movieId)")
                
        let queryParameters = [URLQueryItem(name: "api_key", value: apiKey),
                               URLQueryItem(name: "language", value: "en-US")]

        let request = self.setupRequestWorkerObj.setupUrlQueryRequest(headerConfig: headerConfig,
                                                                      queryParameters: queryParameters,
                                                                      mainUrl: personDetailURL, selectedHttpMethod: .GET)
        
        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletion(response, data, error, completion: completion)
        }).resume()
    }
}
