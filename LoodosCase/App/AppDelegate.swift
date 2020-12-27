//
//  AppDelegate.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 24.12.2020.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let splashVC = SplashViewController()
        let nav = UINavigationController(rootViewController: splashVC)
        nav.navigationBar.isHidden = true
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }

}

