//
//  ListPresenter.swift
//  MovilesApp
//
//  Created by SICAR on 01/Mar/2023.
//

import Foundation
import UIKit

protocol ListMoviesPresentable: AnyObject{
    var ui: ListOfMoviesUI? {get}
    func onViewAppear()
}

protocol ListMoviesUI: AnyObject {
    func update(movies: [PopularMovieEntity])
}

class ListMoviesPresenter {
    weak var ui: ListOfMoviesUI?
    var viewModelRouter = ListMoviesRouter()
    
    private let listOfMoviesInteractor: ListMoviewsInteractor
    var models: [PopularMovieEntity] = []
    private var model: [PopularMovieEntity] = []
    private let router: ListMoviesRouting
    
    init(listOfMoviesInteractor: ListMoviewsInteractor = ListMoviewsInteractor(),
         router: ListMoviesRouting) {
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.router = router
    }
    
    func onViewAppear()async {
        models = await listOfMoviesInteractor.getListOfMovies().results
        ui?.update(movies: models)
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        print(movieId)
        viewModelRouter.showDetailMovie(withMovieId: "\(movieId)")
    }
}
