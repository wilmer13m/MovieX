//
//  SetupRequestWorker.swift
//  Pinkcar&Procar
//
//  Created by Wilmer Mendoza on 24/05/21.
//

import Foundation

class SetupRequestWorker {

    struct HeadersContentConfig {
        var contentType: String = "json"
    }

    func setupRequest(headerConfig: HeadersContentConfig,
                      jsonParameters: Data? = nil,
                      stringParameters: [String: Any]? = ["": ""],
                      mainUrl: String,
                      selectedHttpMethod: BackendConnection.HttpMethods,
                      timeoutInterval: Double = 20.0,
                      useApiKey: Bool = true) -> URLRequest {

        //Setup headers to use in the request
        let headers = ["Content-Type": "application/\(headerConfig.contentType)"]

        var postData: Data!

        if jsonParameters == nil {
            if stringParameters != nil {
                let parameters = stringParameters
                postData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
            }
        } else {
            postData = jsonParameters
        }
        let url = URL(string: mainUrl)!
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)

        request.httpMethod = selectedHttpMethod.rawValue
        request.allHTTPHeaderFields = headers
        if postData != nil {
            request.httpBody = postData
        }

        return request
    }

    func setupGetRequest(sesion: String?,
                         mainUrl: String,
                         selectedHttpMethod: BackendConnection.HttpMethods,
                         timeoutInterval: Double = 20.0) -> URLRequest {
        let headers = [
            "content-type": "application/json"]
        
        var request = URLRequest(url: URL(string: mainUrl)!, timeoutInterval: timeoutInterval)
        request.httpMethod = selectedHttpMethod.rawValue
        request.allHTTPHeaderFields = headers

        return request
    }
    
    func setupUrlQueryRequest(headerConfig: HeadersContentConfig,
                              jsonParameters: Data? = nil,
                              stringParameters: [String: Any]? = nil,
                              queryParameters: [URLQueryItem],
                              mainUrl: String,
                              selectedHttpMethod: BackendConnection.HttpMethods,
                              timeoutInterval: Double = 20.0,
                              useApiKey: Bool = false) -> URLRequest {
        
        //Setup headers to use in the request
        let headers = ["Content-Type": "application/\(headerConfig.contentType)"]
        
        var postData: Data!

        if jsonParameters == nil {
            if stringParameters != nil {
                let parameters = stringParameters
                postData = try? JSONSerialization.data(withJSONObject: parameters!, options: [])
            }
        } else {
            postData = jsonParameters
        }

        var url = URLComponents(string: mainUrl)!
        url.queryItems = queryParameters
        
        var request = URLRequest(url: url.url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutInterval)

        request.httpMethod = selectedHttpMethod.rawValue
        request.allHTTPHeaderFields = headers
        if postData != nil {
            request.httpBody = postData
        }

        return request
    }
}
