//
//  ListMoviesView.swift
//  MovilesApp
//
//  Created by Domingo on 24/Feb/2023.
//

import Foundation
import UIKit

class ListMoviesView: UIViewController {
    private var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieRowView.self, forCellReuseIdentifier: "MovieRowView")
        return tableView
    }()
    
    private let presenter: ListMoviesPresenter
    
    init(presenter: ListMoviesPresenter = ListMoviesPresenter(router: ListMoviesRouter()) ){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setupTableView()
        Task{
            await  presenter.onViewAppear()
        }
        
    }
    
    private func setupTableView() {
        view.addSubview(moviesTableView)
        NSLayoutConstraint.activate([
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
}

extension ListMoviesView: ListMoviesUI {
    func update(movies: [PopularMovieEntity]) {
        print("Datos recibidos \(movies)")
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}

extension ListMoviesView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieRowView", for: indexPath) as! MovieRowView
        // cell.backgroundColor = .red
        let model = presenter.models[indexPath.row]
        
        cell.configure(model: model)
        
        return cell
    }
}


extension ListMoviesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(atIndex: indexPath.row)
    }
}
