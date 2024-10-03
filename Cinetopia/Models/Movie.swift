//
//  Movie.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 16/08/24.
//

import Foundation

class Movie: Decodable {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
    private(set) var isSelected: Bool? = false
    
    // MARK: Class Methods
    
    func changeSelectionStatus() {
        isSelected = !(isSelected ?? false)
    }
}
