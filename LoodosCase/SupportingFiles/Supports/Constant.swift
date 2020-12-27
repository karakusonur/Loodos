//
//  Constant.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 25.12.2020.
//

import Foundation
import UIKit

struct AppConstant {
    static let warning = "UYARI"
    static let notConnectionMessage = "İnternet bağlantınızı lütfen kontrol ediniz."
    static let notMovie = "Aradığınız film bulunamamıştır."
    
    static let attributes = [
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 17)!,
        ]
}

struct Global {
    struct Network {
        static let baseUrl = "http://www.omdbapi.com"
    }
    struct App {
        static let apiKey = "29235896"
    }
}

