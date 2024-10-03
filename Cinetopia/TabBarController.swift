//
//  TabBarController.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 12/09/24.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupTabBarController()
    }
    
    // MARK: - Class Methods
    private func setupTabBarController() {
        let view = MoviesView()
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter(view: view, interactor: interactor)
        let home = UINavigationController(rootViewController: MoviesViewController(presenter: presenter, view: view))
        let favorites = UINavigationController(rootViewController: FavoriteMoviesViewController())
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        
        let homeSymbol = UIImage(systemName: "film", withConfiguration: symbolConfiguration)
        home.tabBarItem.image = homeSymbol
        home.tabBarItem.title = "Filmes populares"
        
        let favoriteSymbol = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        favorites.tabBarItem.image = favoriteSymbol
        favorites.tabBarItem.title = "Favoritos"
        
        self.setViewControllers([home, favorites], animated: true)
    }

}
