//
//  Detail.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 24.12.2020.
//

import Foundation

struct DetailModel: Codable {
    let title : String?
    let year : String?
    let genre : String?
    let actors : String?
    let image : String?
    let imdbRatings : String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case actors = "Actors"
        case image = "Poster"
        case imdbRatings = "imdbRating"
    }
    
}
