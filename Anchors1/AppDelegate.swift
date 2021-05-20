//
//  AppDelegate.swift
//  Anchors
//
//  Created by Felipe Glautier  on 18/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let controller = ViewController()
        window.rootViewController = controller
    
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }

}

