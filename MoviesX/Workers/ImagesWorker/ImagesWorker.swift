//
//  ImagesWorker.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import Foundation

protocol FetchImagesWorkerProtocol {
    func getImagesFromMovie(movieId: Int, completion: @escaping (Bool, ImagesMovieResponse?) -> Void)
}

class ImagesWorker: BaseWorker, FetchImagesWorkerProtocol {
    
    func getImagesFromMovie(movieId: Int, completion: @escaping (Bool, ImagesMovieResponse?) -> Void) {
        
        let headerConfig = SetupRequestWorker.HeadersContentConfig()
        let personDetailURL = backendUrlWorkerObj.getImagesFromMovieURL(movieId: "\(movieId)")
                
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
