//
//  MapperDetailMovieViewModel.swift
//  MovilesApp
//
//  Created by Domingo on 26/Feb/2023.
//

import Foundation
import UIKit

struct MapperDetailMovieViewModel {
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel{
        .init(title: entity.title,
              overview: entity.overview,
              backdropPath: URL(string: "\(globalUrlImage)" + entity.backdropPath),
              status: entity.status,
              releaseDate: entity.releaseDate,
              voteAverage: entity.voteAverage,
              voteCount: entity.voteCount)
    }
}
