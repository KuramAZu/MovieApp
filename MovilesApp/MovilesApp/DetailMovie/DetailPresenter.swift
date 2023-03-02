//
//  DetailPresenter.swift
//  MovilesApp
//
//  Created by Domingo on 26/Feb/2023.
//

import Foundation
import UIKit

protocol DetailPresenterUI: AnyObject{
    func updateUI(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject {
    var ui: DetailPresenterUI? {get}
    var movieId: String {get}
    func onViewAppear()
}

class DetailPresenter: DetailPresentable {
    weak var ui: DetailPresenterUI?
     let movieId: String
    private let interactor: DetailInteractable
    private let mapper: MapperDetailMovieViewModel
    
    init(movieId: String,
        interactor: DetailInteractable,
         mapper: MapperDetailMovieViewModel) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear(){
        Task{
            let model = await interactor.getDetailMoview(withId: movieId)
            let viewModel = mapper.map(entity: model)
            print(model)
            await MainActor.run(body: {
                self.ui?.updateUI(viewModel:viewModel)
                print(viewModel)
            })
        }
    }
}
