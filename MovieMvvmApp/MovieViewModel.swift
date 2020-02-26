//
//  MovieViewModel.swift
//  MovieMvvmApp
//
//  Created by 彭骁略 on 2020/2/25.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    func getMovieItemCount() -> Int {
        return 10
    }
    
    func getMovieInfo(movieItemIndex : Int) -> String {
        return "Hello Swift"
    }
}
