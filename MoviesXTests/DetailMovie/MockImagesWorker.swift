//
//  MockImagesWorker.swift
//  MoviesXTests
//
//  Created by Wilmer Mendoza on 28/5/21.
//

import Foundation

@testable import MoviesX

class MockImagesWorker: BaseWorker, FetchImagesWorkerProtocol {
    
    var successFetch: Bool = true

    func getImagesFromMovie(movieId: Int, completion: @escaping (Bool, ImagesMovieResponse?) -> Void) {
        
        if successFetch {
            completion(true, mockImagesMovieResponse)
        } else {
            completion(false, nil)
        }
    }
}

let mockImagesMovieResponse = ImagesMovieResponse(id: 50,
                               backdrops: nil,
                               posters: [ImagesMovieResponse.Images(id: UUID(),
                                                                    aspectRatio: 1.1, filePath: "",
                                                                    height: 122, iso_639_1: "",
                                                                    voteAverage: nil,
                                                                    voteCount: nil,
                                                                    width: nil),
                                 ImagesMovieResponse.Images(id: UUID(),
                                                                                aspectRatio: 1.1, filePath: "",
                                                                                height: 122, iso_639_1: "",
                                                                                voteAverage: nil,
                                                                                voteCount: nil,
                                                                                width: nil)])
