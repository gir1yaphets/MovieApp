//
//  MovieClient.swift
//  MovieMvvmApp
//
//  Created by 彭骁略 on 2020/2/25.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class MovieClient {
    
    let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
    
    func fetchMovies(completion : @escaping (_ movies : [MovieModel]?) -> () ) {
//        performRequest(with: urlString, completion: completion)
        
        performRequestWithAf(with: urlString, completion: completion)
    }
    
    func performRequest(with urlString : String, completion : @escaping (_ movies : [MovieModel]?) -> ()) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                //parse json
                if let responseData = data {
                    let movies = self.parseJson(movieData: responseData)
                    
                    completion(movies)
                }
            } 
            
            task.resume()
        }
    }
    
    func parseJson (movieData : Data) -> [MovieModel]? {
        let decoder = JSONDecoder()
        var movies : [MovieModel] = []
        
        do {
            let decodedData = try decoder.decode(MovieData.self, from : movieData)
            
            for entry in decodedData.feed.entry {
                let movieName = entry.imName.label
                let movieModel = MovieModel(movieName : movieName)
                
                movies.append(movieModel)
            }
            
            return movies
        } catch {
            return nil
        }
    }
    
    func performRequestWithAf(with urlString : String, completion : @escaping (_ movies : [MovieModel]) -> ()) -> Void {
        var movies : [MovieModel] = []
        
        AF.request(urlString)
            .responseDecodable(of: MovieData.self) { (responseDec) in
                guard let decodedData = responseDec.value
                    else {return}
                
                for entry in decodedData.feed.entry {
                    let movieName = entry.imName.label
                    let movieModel = MovieModel(movieName: movieName)
                    
                    movies.append(movieModel)
                }
                
                completion(movies)
        }
    }
}
