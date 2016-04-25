//
//  AppDelegate.swift
//  GdanskNumerek
//
//  Created by Eliasz Sawicki on 27/02/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainViewController: UIViewController!
    var mainNavigationController: UINavigationController!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool { 			
        Fabric.with([Crashlytics.self])

        self.mainViewController = MainViewController()
        self.mainNavigationController = UINavigationController(rootViewController: self.mainViewController)
        self.window = UIWindow()
        
        self.window?.rootViewController = self.mainNavigationController
        self.window?.frame = UIScreen.mainScreen().bounds
        self.window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().tintColor = UIColor.lightWhiteColor()
        return true
    }
}

