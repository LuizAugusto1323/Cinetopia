//
//  Protocols.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 03/10/24.
//

import UIKit

protocol MoviesPresenterToInteractorProtocol: AnyObject {
    func fetchMovies() async throws -> [Movie]
}

protocol MoviesPresenterToViewControllerProtocol: AnyObject {
    func setViewController(_ moviesViewController: MoviesViewControllerToPresenterProtocol)
    func viewDidLoad()
    func viewDidAppear()
}

protocol MoviesPresenterToViewProtocol: AnyObject {
    func didSelect(movie: Movie)
    func didSelectedFavoriteButton(_ movie: Movie)
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie])
}

protocol MovieTableViewCellDelegate: AnyObject {
    func didSelectFavoriteButton(sender: UIButton)
}

protocol FavoriteMovieCollectionViewCellDelegate: AnyObject {
    func didSelectFavoriteButton(_ sender: UIButton)
}

protocol MoviesViewControllerToPresenterProtocol: AnyObject {
    func didSelectMovie(_ movie: Movie)
}

protocol MoviesViewProtocol: AnyObject {
    func setPresenter(_ presenter: MoviesPresenterToViewProtocol)
    func setupView(with movies: [Movie])
    func reloadData()
    func reloadRow(at indexPath: IndexPath)
    func toggle(_ isActive: Bool)
}


