//
//  AppDelegate.swift
//  SplitViewCustomApp
//
//  Created by TriosMac on 2020-08-27.
//  Copyright © 2020 TriosMac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    //var splitViewDelegate = SplitViewDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let splitViewController = self.window?.rootViewController as? UISplitViewController,
            let navigationController = splitViewController.viewControllers.last as? UINavigationController
        {
            //splitViewController.delegate = splitViewDelegate
            
            navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            navigationController.topViewController?.navigationItem.leftItemsSupplementBackButton = true
        }
        
        //let splitVC = window!.rootViewController as! UISplitViewController
        //splitVC.delegate = self
        //let navigationVC = splitVC.viewControllers.last as? UINavigationController
        //navigationVC?.topViewController!.navigationItem.leftBarButtonItem = splitVC.displayModeButtonItem
        
        // Override point for customization after application launch.
        //IQKeyboardManager.shared.enable = true
        return true
    }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController)
    -> Bool {
            guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
            guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
            if topAsDetailController.detailItem == nil {
                    // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
                return true
            }
        
        return false
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    

}

