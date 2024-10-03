//
//  MoviesPresenter.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 30/09/24.
//

import UIKit

class MoviesPresenter {
    // MARK: - Attributes
    private var controller: MoviesViewControllerToPresenterProtocol?
    private var view: MoviesViewProtocol?
    private var interactor: MoviesPresenterToInteractorProtocol?
    
    // MARK: - Init
    init(view: MoviesViewProtocol, interactor: MoviesPresenterToInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension MoviesPresenter: MoviesPresenterToViewControllerProtocol {
    func setViewController(_ moviesViewController: any MoviesViewControllerToPresenterProtocol) {
        self.controller = moviesViewController
    }
    
    func viewDidLoad() {
        view?.setPresenter(self)
        Task { await fetchMovies() }
    }
    
    func viewDidAppear() {
        view?.reloadData()
    }
    
    // MARK: - Class Methods
    private func fetchMovies() async {
        do {
            guard let movies = try await interactor?.fetchMovies() else { return }
            view?.setupView(with: movies)
            view?.reloadData()
        } catch(let error) {
            print(error)
        }
    }
}

// para debugar com break points, vc pode digitar po e o nome da
// variavel para ver o seu valor
extension MoviesPresenter: MoviesPresenterToViewProtocol {
    func didSelect(movie: Movie) {
        controller?.didSelectMovie(movie)
    }
    
    func didSelectedFavoriteButton(_ movie: Movie) {
        movie.changeSelectionStatus()
        MovieManager.shared.add(movie)
    }
    
    // inout serve para que uma variavel passada como parametro possa ser alterada
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie]) {
        if searchText.isEmpty {
            view?.toggle(false)
        } else {
            view?.toggle(true)
            filteredMovies = movies.filter(
                { movie in movie.title.lowercased().contains(searchText.lowercased()) }
            )
        }
    }
    
}
