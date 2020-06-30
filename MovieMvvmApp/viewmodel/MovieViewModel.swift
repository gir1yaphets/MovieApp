//
//  MovieViewModel.swift
//  MovieMvvmApp
//
//  Created by 彭骁略 on 2020/2/25.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import Foundation
import RxSwift

class MovieViewModel {
    
    var movies : BehaviorSubject<[MovieModel]>?
    
    func fetchMovies() -> Observable<[MovieSections]> {
        return ApiManager.shared.fetchMovies()
    }
    
}
