//
//  AppDelegate.swift
//  my to-do list
//
//  Created by Sardor Panjiyev on 19/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = MainVC(nibName: "MainVC", bundle: nil)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    

        return true
    }

    
    
    
    
    
    

}

