//
//  PopularMovieEntitie.swift
//  MovilesApp
//
//  Created by Domingo on 24/Feb/2023.
//

import Foundation
import UIKit

//MARK: GET: WS =  /movie/popular
struct PopularMovieEntity: Decodable{
    var imageURL: String
    var adult: Bool
    var overview: String
    var date: String
    let id: Int
    let titleOriginal: String
    let idioma: String
    let title: String
    var image2: String
    var popularity: Decimal
    var conteoVotos: Int
    var video: Bool
    var promedioVotos: Decimal
    
    enum CodingKeys: String, CodingKey{
        case imageURL = "poster_path"
        case adult
        case overview
        case date = "release_date"
        case id
        case titleOriginal = "original_title"
        case idioma = "original_language"
        case title
        case image2 = "backdrop_path"
        case popularity
        case conteoVotos = "vote_count"
        case video
        case promedioVotos = "vote_average"
    }
}

struct PopularMovieResponseEntity: Decodable{
    let results: [PopularMovieEntity]
}
