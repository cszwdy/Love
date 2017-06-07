//
//  AppDelegate.swift
//  Love
//
//  Created by Emiaostein on 04/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        setupLogin()
        setup()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate {
    
//    func setupLogin() {
//        window = UIWindow()
//        let rootVC = LoginViewController()
//        window?.rootViewController = rootVC
//        window?.makeKeyAndVisible()
//    }
    
    func setup() {
        
        window = UIWindow()
        
        let tabbarVC = ASTabBarController()
        // bar style
        tabbarVC.tabBar.unselectedItemTintColor = UIColor.theme.minorForward
        tabbarVC.tabBar.theme.tintColor{_ in UIColor.theme.tint}
        tabbarVC.tabBar.theme.backgroundColor{_ in UIColor.theme.backward}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            App.theme.light = false
        }
        
        App.theme.add {[weak tabbarVC] (light) in
//            tabbarVC?.viewControllers?[0].setNeedsStatusBarAppearanceUpdate()
            tabbarVC?.tabBar.barStyle = light ? UIBarStyle.default : UIBarStyle.black
        }
        
        let vc: [UIViewController] = [MosaicViewController(), DiscoverViewController(), MessageViewController(), CenterViewController(), NodeTestViewController()]
        let item = [UITabBarItem(title: "", image: #imageLiteral(resourceName: "Iconhome-normal"), selectedImage: #imageLiteral(resourceName: "Iconhome-selected")),
                    UITabBarItem(title: "", image: #imageLiteral(resourceName: "Icondiscover-normal"), selectedImage: #imageLiteral(resourceName: "Icondiscover-selected")),
                    UITabBarItem(title: "", image: #imageLiteral(resourceName: "Iconmessage-normal"), selectedImage: #imageLiteral(resourceName: "Iconmessage-selected")),
                    UITabBarItem(title: "", image: #imageLiteral(resourceName: "Iconsetting-normal"), selectedImage: #imageLiteral(resourceName: "Iconsetting-selected")),
                    UITabBarItem.init(tabBarSystemItem: .favorites, tag: 4)]
        
        for i in 0..<vc.count {
            let v = vc[i]
            v.tabBarItem = item[i]
            v.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        tabbarVC.viewControllers = vc
        tabbarVC.selectedIndex = 4
        window?.rootViewController = tabbarVC
        window?.makeKeyAndVisible()
    }
}

