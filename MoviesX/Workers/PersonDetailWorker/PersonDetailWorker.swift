//
//  PersonDetailWorker.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import Foundation

protocol FetchPersonDetailProtocol {
    func getPersonDetail(personId: Int, completion: @escaping (Bool, PersonDetail?) -> Void)
}

class PersonDetailWorker: BaseWorker, FetchPersonDetailProtocol {

    func getPersonDetail(personId: Int, completion: @escaping (Bool, PersonDetail?) -> Void) {
        
        let headerConfig = SetupRequestWorker.HeadersContentConfig()
        let personDetailURL = backendUrlWorkerObj.getPersonDetailURL(personId: "\(personId)")
                
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
