//
//  DetailRouter.swift
//  MovilesApp
//
//  Created by Domingo on 26/Feb/2023.
//

import Foundation
import UIKit

protocol DetailRouting: AnyObject {
    func showDetail(fromViewController: UIViewController, withMovieId movieId: String)
}

class DetailRouter: DetailRouting {
    func showDetail(fromViewController: UIViewController, withMovieId movieId: String) {
        
        let presenter = DetailPresenter(movieId: movieId,
                                        interactor: DetailInteractor(),
                                        mapper: MapperDetailMovieViewModel())
        let view = DetailView(presenter: presenter)
        
        presenter.ui = view
        
        fromViewController.present(view, animated: true)
    }
}
