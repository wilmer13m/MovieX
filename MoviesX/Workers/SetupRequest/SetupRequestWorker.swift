//
//  SetupRequestWorker.swift
//  Pinkcar&Procar
//
//  Created by Javier Susa on 28/09/20.
//

import Foundation
import UIKit

class SetupRequestWorker {

    struct HeadersContentConfig {
        var contentType: String = "json"
        var xApiKey: String?
        var xFullMap: String = "false"
        var xLanguageCode: String?
    }

    func setupRequest(headerConfig: HeadersContentConfig,
                      jsonParameters: Data? = nil,
                      stringParameters: [String: Any]? = ["": ""],
                      mainUrl: String,
                      selectedHttpMethod: BackendConnection.HttpMethods,
                      timeoutInterval: Double = 20.0,
                      useApiKey: Bool = true) -> URLRequest {

        //Setup headers to use in the request
        var headers = ["Content-Type": "application/\(headerConfig.contentType)"]

        if let languageCode = Locale.current.languageCode {
            headers["x-language-code"] = languageCode != "en" ? "es" : languageCode
        }
        
        if let apiKey = headerConfig.xApiKey {
            headers["x-api-key"] = apiKey
        }
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
                         timeoutInterval: Double = 1200.0) -> URLRequest {
        var headers = [
            "content-type": "application/json"]

        if sesion != nil {
            headers["x-api-key"] = sesion
        }

        if let languageCode = Locale.current.languageCode {
            headers["x-language-code"] = languageCode != "en" ? "es" : languageCode
        }
        
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
        var headers = ["Content-Type": "application/\(headerConfig.contentType)"]

        headers["x-language-code"] = headerConfig.xLanguageCode

        if useApiKey, let apiKey = headerConfig.xApiKey {
            headers["x-api-key"] = apiKey
        }
        
        if let languageCode = Locale.current.languageCode {
            headers["x-language-code"] = languageCode != "en" ? "es" : languageCode
        }
        
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
