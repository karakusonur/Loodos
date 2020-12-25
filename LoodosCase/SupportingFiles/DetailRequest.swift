//
//  DetailRequest.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 24.12.2020.
//

import Foundation

struct DetailRequest : Codable{
    var detailText : String
    var apiKey : String = Global.App.apiKey
    
    init(detail: String) {
        self.detailText = detail
    }
    
    enum CodingKeys: String, CodingKey {
        case detailText = "t"
        case apiKey = "apikey"
    }
}
