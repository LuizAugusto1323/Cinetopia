//
//  MoviesInteractors.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 03/10/24.
//

import Foundation

class MoviesInteractor: MoviesPresenterToInteractorProtocol {
    
    private let movieService: MovieService = MovieService()
    
    func fetchMovies() async throws -> [Movie] {
        do {
            let movies = try await movieService.getMovies()
            return movies
        } catch(let error) {
            throw error
        }
    }
    
}
