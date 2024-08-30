//
//  Movie.swift
//  Cinetopia
//
//  Created by Luiz Augusto Fernandes Gomes de Lima on 16/08/24.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
}

/*
 let movies: [Movie] = [
    Movie(id: 1, title: "Constantine", image: "Constantine", synopsis: "Contos sobrenaturais baseados nas histórias em quadrinhos Hellblazer. O solitário Constantine tenta garantir seu lugar no paraíso enviando demônios de volta ao inferno, mas seu destino está ligado ao de Angela, uma policial que investiga o suposto suicídio de sua irmã gêmea.", rate: 8.3, releaseDate: "11/03/2005"),
    
    Movie(id: 1, title: "Rei Leão", image: "ReiLeao", synopsis: "Este desenho animado da Disney mostra as aventuras de um leão jovem de nome Simba, o herdeiro de seu pai, Mufasa. O tio malvado de Simba, Oscar, planeja roubar o trono de Mufasa atraindo pai e filho para uma emboscada. Simba consegue escapar e somente Mufasa morre. Com a ajuda de seus amigos,Timon e Pumba, ele reaparece como adulto para recuperar sua terra, que foi roubada por seu tio Oscar.", rate: 8.9, releaseDate: "08/07/1994"),
    
    Movie(id: 1, title: "As Branquelas", image: "AsBranquelas", synopsis: "Dois irmãos agentes do FBI, Marcus e Kevin Copeland, acidentalmente evitam que bandidos sejam presos em uma apreensão de drogas. Como castigo, eles são forçados a escoltar um par de socialites nos Hamptons. Quando as meninas descobrem o plano da agência, elas se recusam a ir. Sem opções, Marcus e Kevin, dois homens negros, decidem fingir que são as irmãs e se transformam em um par de loiras.", rate: 9.5, releaseDate: "27/08/2004"),
]
*/
