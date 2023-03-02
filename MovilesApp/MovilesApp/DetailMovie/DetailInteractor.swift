//
//  DetailInteractor.swift
//  MovilesApp
//
//  Created by Domingo on 26/Feb/2023.
//

import Foundation
import UIKit

protocol DetailInteractable: AnyObject{
    func getDetailMoview(withId id : String )async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable{
    func getDetailMoview(withId id : String )async -> DetailMovieEntity {
        let url = URL(string: "\(baseUrl)/movie/\(id)?api_key=\(apiKey)")!
        let (data,_) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
    }
}
