//
//  ApiManager.swift
//  MovieMvvmApp
//
//  Created by Xiaolue Peng on 5/28/20.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class ApiManager {
    static let shared = ApiManager()
    
    let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        
        func fetchMovies() -> Promise<[MovieModel]> {
            return performRequestWithAf(with: urlString)
        }
        
        func performRequestWithAf(with urlString : String) -> Promise<[MovieModel]> {
            return Promise() { seal in
                var movies : [MovieModel] = []
                
                AF.request(urlString).responseDecodable(of: MovieData.self, queue: .main) { (response) in
                    switch response.result {
                    case let.success(data):
                        for entry in data.feed.entry {
                            let movieName = entry.imName.label
                            let movieModel = MovieModel(movieName: movieName)
                            
                            movies.append(movieModel)
                        }
                        
                        seal.fulfill(movies)
                    case let.failure(error):
                        seal.reject(error)
                    }
                }
            }
        }
}
