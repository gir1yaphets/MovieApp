//
//  MovieViewModel.swift
//  MovieMvvmApp
//
//  Created by 彭骁略 on 2020/2/25.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    var movieClient : MovieClient = MovieClient()
    var movies : [MovieModel]?
    
    func getMovieItemCount() -> Int {
        return movies?.count ?? 0
    }
    
    func getMovieInfo(movieItemIndex : Int) -> String {
        guard let name = movies?[movieItemIndex].movieName
            else {
                return ""
            }
        
        return name
    }
    
    func fetchMovies(completion : @escaping (_ movies : [MovieModel]?) -> ()) {
        movieClient.fetchMovies { (movies : [MovieModel]?) in
            self.movies = movies
            completion(movies)
        }
    }
}
