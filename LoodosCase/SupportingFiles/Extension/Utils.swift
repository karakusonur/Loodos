//
//  Utils.swift
//  LodosChallenge
//
//  Created by Onur Karakuş on 25.12.2020.
//

import Foundation
import UIKit


class Utils: NSObject {
    
    static func getAppDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
