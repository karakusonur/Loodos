//
//  Search.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 24.12.2020.
//

import Foundation

struct SearchModel: Codable {
    let search: [Search]?
    let totalResults: String?
    let response: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

struct Search: Codable {
    let title : String?
    let year : String?
    let imdbId : String?
    let type : String?
    let image : String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case image = "Poster"
    }
    
}
