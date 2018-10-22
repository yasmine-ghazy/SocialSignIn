//
//  AppDelegate.swift
//  SocialSignIn
//
//  Created by apple on 8/19/18.
//  Copyright © 2018 Yasmine Ghazy. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKCoreKit
import TwitterKit
import LinkedinSwift
import Localize_Swift
import Material

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        if FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation]) { return true }
        
        if GIDSignIn.sharedInstance().handle(url,sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,annotation: options[UIApplicationOpenURLOptionsKey.annotation]) { return true }
        
        // Linkedin sdk handle redirect
        if LinkedinSwiftHelper.shouldHandle(url) {
            return LinkedinSwiftHelper.application(app,
                                                   open: url, sourceApplication: [UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
            
        }
        if TWTRTwitter.sharedInstance().application(app, open: url, options: options){
            return true
        }
        
        
        return false
    }

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Initialize Sign-in
        GIDSignIn.sharedInstance().clientID = API.Google_clientID
        
        TWTRTwitter.sharedInstance().start(withConsumerKey: API.Twitter_consumerKey , consumerSecret: API.Twitter_consumerSecret)
        
        //open initial vc
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let initialVC = LoginVC()
        let nav = UINavigationController(rootViewController: initialVC)
        nav.setNavigationBarHidden(true, animated: false)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        //set palete
        Colors.setPalete(palete: .second)
        
        //Setup Navigationbar
        var navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = Colors.backBtn
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-1000, 0), for:UIBarMetrics.default)
        
        adjustLanguage()
        
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

    
    func adjustLanguage() {
        if Localize.currentLanguage() == "ar" {
            UILabel.appearance().semanticContentAttribute = .forceRightToLeft
            UITextView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
            TextField.appearance().semanticContentAttribute = .forceRightToLeft
            ErrorTextField.appearance().semanticContentAttribute = .forceRightToLeft
            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
            UITableViewCell.appearance().semanticContentAttribute = .forceRightToLeft
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
            
        } else {
            UILabel.appearance().semanticContentAttribute = .forceLeftToRight
            UITextView.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().semanticContentAttribute = .forceLeftToRight
            TextField.appearance().semanticContentAttribute = .forceLeftToRight
            ErrorTextField.appearance().semanticContentAttribute = .forceLeftToRight
            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }

}
