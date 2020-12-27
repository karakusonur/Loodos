//
//  SplashViewController.swift
//  LoodosCase
//
//  Created by Onur Karakuş on 25.12.2020.
//

import UIKit
import Firebase

class SplashViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkInternet()
    }
    
    
   private func checkInternet () {
        HUDHelper.showHud(text: "", alphaValue: 0.4)
        if Reachability.isConnectedToNetwork(){
            goToHomePage()
        }else{
            HUDHelper.hideHud()
            self.createDefaultAlert(title: AppConstant.warning, message: AppConstant.notConnectionMessage) {
                self.checkInternet()
            }
        }
    }
    
    private func goToHomePage(){
        
        RCValues.loadDefaultValues()
        RCValues.fetchRemoteConfig { [unowned self] (loodosName) in
            print(loodosName)
            self.messageLabel.text = loodosName
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                HUDHelper.hideHud()
                self.goHome()
            }
        }
    }
    
    
    func goHome() {
        let homeVC = HomeViewController()
        let nav = UINavigationController(rootViewController: homeVC)
        nav.navigationBar.isHidden = true
        Utils.getAppDelegate().window?.rootViewController = nav
    }
}
