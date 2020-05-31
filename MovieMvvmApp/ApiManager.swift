//
//  ApiManager.swift
//  MovieMvvmApp
//
//  Created by Xiaolue Peng on 5/30/20.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class ApiManager {
    static let shared = ApiManager()
    
    let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        
    func fetchMovies() -> Observable<[MovieSections]> {
        return Observable<[MovieSections]>.create { (observer) -> Disposable in
            AF.request(self.urlString).responseDecodable(of: MovieData.self) { (response) in
                guard let decodedData = response.value else {
                    return
                }
                
                var movies = [MovieModel]()
                var movieSection = [MovieSections]()
                
                for entry in decodedData.feed.entry {
                    let movieName = entry.imName.label
                    let movieModel = MovieModel(movieName: movieName)
                    
                    movies.append(movieModel)
                }
            
                movieSection.append(MovieSections(items: movies))
                observer.onNext(movieSection)
            }
            
            return Disposables.create()
        }
    }
}
