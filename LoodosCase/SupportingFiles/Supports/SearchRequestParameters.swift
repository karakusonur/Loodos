//
//  SearchRequestParameters.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 24.12.2020.
//

import Foundation

struct SearchRequest : Codable{
    var searchText : String
    var apiKey : String = Global.App.apiKey
    
    init(search: String) {
        self.searchText = search
    }
    
    enum CodingKeys: String, CodingKey {
        case searchText = "s"
        case apiKey = "apikey"
    }
}
