//
//  MovieManager.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 18/09/24.
//

import Foundation

class MovieManager {
    
    // MARK: - Attributes
    
    static let shared = MovieManager()
    var favoriteMovies: [Movie] = []
    
    // MARK: - Init
    
    private init() { }

    // MARK: Class methods
    
    func add(_ movie: Movie) {
        if favoriteMovies.contains(where: {$0.id == movie.id}) {
            remove(movie)
        } else {
            favoriteMovies.append(movie)
        }
    }
    
    func remove(_ movie: Movie) {
        if let index = favoriteMovies.firstIndex(where: { $0.id == movie.id }) {
            favoriteMovies.remove(at: index)
        }
    }
}
