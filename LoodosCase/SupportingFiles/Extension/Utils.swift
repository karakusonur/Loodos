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

extension UIViewController {
    
    func createDefaultAlert(title:String,message:String,okCallBack: (()->())? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        if okCallBack != nil{
            action = UIAlertAction(title: "Tamam", style: .default) { (action) in
                okCallBack?()
            }
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
