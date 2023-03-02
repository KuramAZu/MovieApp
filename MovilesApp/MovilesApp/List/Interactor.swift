//
//  ListMoviesPresenter.swift
//  MovilesApp
//
//  Created by Domingo on 24/Feb/2023.
//

import Foundation
import UIKit

protocol ListOfMoviesPresentable: AnyObject{
    var ui: ListOfMoviesUI? {get}
    //var viewModels: [viewModel] {get}
    func onViewAppear()
    //func onTapCell(atIndex: indexPath.row)
}

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [PopularMovieEntity])
}

class ListOfMoviesPresenter {
    weak var ui: ListOfMoviesUI?
    
    private let listOfMoviesInteractor: ListMoviewsInteractor
    var models: [PopularMovieEntity] = []
    private var model: [PopularMovieEntity] = []
  
    
    init(listOfMoviesInteractor: ListMoviewsInteractor = ListMoviewsInteractor()) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
    }
    
    func onViewAppear()async {
        models = await listOfMoviesInteractor.getListOfMovies().results
        ui?.update(movies: models)
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        print(movieId)
      
    }
}
  
