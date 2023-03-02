//
//  ListInteractor.swift
//  MovilesApp
//
//  Created by SICAR on 01/Mar/2023.
//

import Foundation
import UIKit


public let baseUrl: String = "https://api.themoviedb.org/3"
public let apiKey: String = "b12119e37962af81dc75326677ba5b7c"
public let globalUrlImage = "https://image.tmdb.org/t/p/w200"

protocol ListMoviesProtocolInteractor: AnyObject {
    func getListOfMovies() async -> PopularMovieResponseEntity
}

class ListMoviewsInteractor: ListMoviesProtocolInteractor {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "\(baseUrl)/movie/popular?api_key=\(apiKey)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}
