//
//  AlertExtension.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 28.12.2020.
//

import Foundation

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
