//
//  ListRouter.swift
//  MovilesApp
//
//  Created by SICAR on 01/Mar/2023.
//

import Foundation
import UIKit


protocol ListMoviesRouting {
    var detailRouter: DetailRouting? { get }
    var listMoviesView: ListMoviesView? { get }
   
    func showDetailMovie(withMovieId movieId: String)
}

class ListMoviesRouter : ListMoviesRouting{
    var detailRouter: DetailRouting?
    var listMoviesView: ListMoviesView?
    
        func showList(fromViewController: UIViewController){
            self.detailRouter = DetailRouter()
            let interactor = ListMoviewsInteractor()
            let presenter = ListMoviesPresenter(router: self)
            
            let view = ListMoviesView(presenter: presenter)
            
            fromViewController.present(view, animated: true)
        }
      
    func showDetailMovie(withMovieId movieId: String) {
        guard let vc = listMoviesView else { return }
        detailRouter?.showDetail(fromViewController: vc, withMovieId: movieId)
    }
}

