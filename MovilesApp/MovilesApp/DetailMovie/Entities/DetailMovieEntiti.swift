//
//  DetailMovieEntiti.swift
//  MovilesApp
//
//  Created by Domingo on 26/Feb/2023.
//

import Foundation
import UIKit

//MARK: GET: WS =  /movie/{movie_id}
struct DetailMovieEntity: Decodable{
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey{
        case title 
        case overview
        case backdropPath
        case status
        case releaseDate
        case voteAverage
        case voteCount
    }
}
