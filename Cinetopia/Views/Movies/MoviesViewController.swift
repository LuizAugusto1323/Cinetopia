//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 14/08/24.
//

import UIKit

class MoviesViewController: UIViewController {
    
    private var presenter: MoviesPresenterToViewControllerProtocol?
    private var mainView: MoviesView?
    
    init(
        presenter: MoviesPresenterToViewControllerProtocol,
        view: MoviesView
    ) {
        super.init(nibName: "", bundle: nil)
        self.presenter = presenter
        self.mainView = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setViewController(self)
        presenter?.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
    
    
    private func setupNavigationBar (){
        title = "Filmes populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.titleView = mainView?.searchBar
    }
}

extension MoviesViewController: MoviesViewControllerToPresenterProtocol {
    func didSelectMovie(_ movie: Movie) {
        let detailsVC = MovieDetailsViewController(movie: movie)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
