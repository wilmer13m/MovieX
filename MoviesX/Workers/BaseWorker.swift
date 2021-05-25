//
//  BaseWorker.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import UIKit

class BaseWorker {
    
    let backendUrlWorkerObj = BackendURLWorker()
    let setupRequestWorkerObj = SetupRequestWorker()
    let session: URLSessionProtocol
    let apiKey = (Bundle.main.infoDictionary?["API Key"] as? String)?
        .replacingOccurrences(of: "\\", with: "")

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func responseCompletion<T: Codable>(_ response: URLResponse?,
                                        _ data: Data?,
                                        _ error: Error?,
                                        completion: @escaping (Bool, T?) -> Void) {
        DispatchQueue.main.async {
            guard error?.localizedDescription == nil else {
                NSLog(error!.localizedDescription)
                completion(false, nil)
                return
            }
            do {
                let httpStatus = response as? HTTPURLResponse
                if httpStatus?.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(T.self, from: data!)
                    completion(true, response)
                } else {
                    NSLog("\(String(describing: httpStatus?.statusCode))")
                    completion(false, nil)
                }
            } catch {
                NSLog(error.localizedDescription)
                completion(false, nil)
            }
        }
    }
}
