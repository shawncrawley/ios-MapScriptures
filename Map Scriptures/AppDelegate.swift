//
//  AppDelegate.swift
//  Map Scriptures
//
//  Created by Shawn Crawley on 10/25/16.
//  Copyright © 2016 Shawn Crawley. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    
    //MARK: - Storyboard
    
    private struct Storyboard {
        static let detailViewControllerIdentifier = "DetailVC"
        static let name = "Main"
    }
    
    
    //MARK: - Properties
    
    var window: UIWindow?

    //MARK: - Application lifecycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let splitViewController = window!.rootViewController as? UISplitViewController {
            splitViewController.delegate = self
        }
        return true
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        return true
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        if let navVC = primaryViewController as? UINavigationController {
            for controller in navVC.viewControllers {
                if controller.restorationIdentifier == Storyboard.detailViewControllerIdentifier {
                    return controller
                }
            }
        }
        
        let storyboard = UIStoryboard(name: Storyboard.name, bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: Storyboard.detailViewControllerIdentifier)
        
        return detailVC
    }

}

