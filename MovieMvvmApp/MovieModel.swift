//
//  MovieModel.swift
//  MovieMvvmApp
//
//  Created by Xiaolue Peng on 2/25/20.
//  Copyright © 2020 xiaoluepeng. All rights reserved.
//

import Foundation
import RxDataSources

struct MovieSections {
    var items: [MovieModel]
}

extension MovieSections: SectionModelType {
    init(original: MovieSections, items: [MovieModel]) {
        self = original
        self.items = items
    }
    
    typealias Item = MovieModel
}

struct MovieModel {
    let movieName : String
}


