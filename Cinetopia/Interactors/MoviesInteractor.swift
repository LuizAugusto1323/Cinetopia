//
//  MoviesInteractors.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 03/10/24.
//

import Foundation

protocol MoviesPresenterToInteractorProtocol: AnyObject {
    func fetchMovies() async throws -> [Movie]
}

class MoviesInteractor {
    
}
