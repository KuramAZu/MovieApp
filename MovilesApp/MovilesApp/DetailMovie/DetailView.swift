//
//  DetailView.swift
//  MovilesApp
//
//  Created by Domingo on 26/Feb/2023.
//

import Foundation
import UIKit
import Kingfisher

class DetailView: UIViewController {
    private let presenter: DetailPresentable
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 30, weight: .bold, width: .condensed)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular, width: .standard)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let voteCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupView()
        presenter.onViewAppear()
    }
    
    private func setupView() {
        view.addSubview(movieImageView)
        view.addSubview(movieName)
        view.addSubview(movieDescription)
        view.addSubview(statusLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(voteAverageLabel)
        view.addSubview(voteCountLabel)
        
        NSLayoutConstraint.activate([
            movieImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            movieImageView.heightAnchor.constraint(equalToConstant: 250),
            movieImageView.widthAnchor.constraint(equalToConstant: 350),
            
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieName.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),
            
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 20),
            
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 8),
            
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            releaseDateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            voteAverageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            voteAverageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            voteAverageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            voteCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            voteCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            voteCountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
        ])
    }
}

extension DetailView: DetailPresenterUI {
    func updateUI(viewModel: DetailMovieViewModel) {
        movieImageView.kf.setImage(with: viewModel.backdropPath)
        movieName.text = viewModel.title
        movieDescription.text = viewModel.overview
        statusLabel.text = viewModel.status
        releaseDateLabel.text = viewModel.releaseDate
        voteAverageLabel.text = "\(viewModel.voteAverage)"
        voteCountLabel.text = "\(viewModel.voteCount)"
    }
}

