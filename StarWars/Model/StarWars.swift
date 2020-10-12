//
//  StarWars.swift
//  StarWars
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//

import UIKit

struct Home: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct Film: Codable {
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case title
    }
}

struct CharList: Codable {
    var results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Character: Codable {
    var name: String
    var height: String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var homeworld: String
    var gender: String
    var films: [String]
    var species: [String?]
    var vehicles: [String?]
    var starships: [String?]
    var created: String
    var edited: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case name, height, mass, gender, films, species, homeworld, vehicles, starships, created, edited, url
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
    }
}

