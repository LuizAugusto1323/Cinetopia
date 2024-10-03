//
//  FavoriteMoviesViewController.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 03/09/24.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {
    
    // MARK: - Ui Components
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 27, bottom: 20, right: 27)
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FavoriteMovieCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteMovieCollectionViewCell")
        collectionView.register(FavoriteCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FavoriteCollectionReusableView")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
        
    }()
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }

    // MARK: - Class methods
    
    private func addSubviews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension FavoriteMoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieManager.shared.favoriteMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteMovieCollectionViewCell", for: indexPath) as? FavoriteMovieCollectionViewCell else { fatalError("error to create FavoriteMovieCollectionViewCell") }
        
        let currentMovie = MovieManager.shared.favoriteMovies[indexPath.item]
        cell.setupView(currentMovie)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FavoriteCollectionReusableView", for: indexPath) as? FavoriteCollectionReusableView else {
                fatalError("error to create collection view header")
            }
            
            headerView.setupTitle("Meus filmes favoritos")
            
            return headerView
        }
        
        return UICollectionReusableView()
    }
}

extension FavoriteMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}

extension FavoriteMoviesViewController: FavoriteMovieCollectionViewCellDelegate {
    func didSelectFavoriteButton(_ sender: UIButton) {
        guard let cell = sender.superview as? FavoriteMovieCollectionViewCell else { return }
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        let selectedMovie = MovieManager.shared.favoriteMovies[indexPath.item]
        selectedMovie.changeSelectionStatus()
        MovieManager.shared.remove(selectedMovie)
        collectionView.reloadData()
    }
}

#Preview {
    FavoriteMoviesViewController()
}
