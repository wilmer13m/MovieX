//
//  DownloadImageWorker.swift
//  MoviesX
//
//  Created by Wilmer Mendoza on 24/5/21.
//

import Foundation

class DownloadImageWorker: BaseWorker {

    func getImage(_ url: String?, completion: @escaping (Bool, Data?) -> Void) {
        guard let newURL = URL(string: url ?? "") else {
            completion(false, nil)
            return
        }
        let request = URLRequest(url: newURL)
        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            self.responseCompletionImage(response, data, error, completion: completion)
        }).resume()
    }

    fileprivate func responseCompletionImage(_ response: URLResponse?,
                                             _ data: Data?,
                                             _ error: Error?,
                                             completion: @escaping (Bool, Data?) -> Void) {
        DispatchQueue.main.async {
            let httpStatus = response as? HTTPURLResponse
            if httpStatus?.statusCode == 200 {
                completion(true, data)
            } else {
                NSLog("\(httpStatus?.statusCode ?? 400)")
                NSLog("\(httpStatus?.description ?? "Error getImage Function")")
                completion(false, nil)
            }
        }
    }
}
