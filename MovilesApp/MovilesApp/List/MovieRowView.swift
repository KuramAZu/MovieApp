//
//  MovieRowView.swift
//  PruebaMoviesApp
//
//  Created by Domingo on 24/Feb/2023.
//

import Foundation
import UIKit
import Kingfisher

class MovieRowView: UITableViewCell {
    
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .green
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .green
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
        
    func setupViews(){
        contentView.addSubview(movieImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            // Constraints for movieImageView
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            movieImageView.heightAnchor.constraint(equalToConstant: 150),
            movieImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
    
            // Constraints for titleLabel
            titleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            // Constraints for dateLabel
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            
            // Constraints for ratingLabel
            ratingLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            
            // Constraints for descriptionLabel
            descriptionLabel.leadingAnchor.constraint(equalTo: ratingLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: ratingLabel.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 8),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: PopularMovieEntity){
        movieImageView.kf.setImage(with: URL(string: globalUrlImage + model.imageURL))
        titleLabel.text = model.title
        dateLabel.text = model.date
        ratingLabel.text = "\(model.popularity)"
        descriptionLabel.text = model.overview
    }
}
