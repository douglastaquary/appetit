//
//  AppDelegate.swift
//  AppTestes
//
//  Created by Sense Infoway on 28/12/16.
//  Copyright © 2016 Douglas Taquary. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        ApperanceProxyHelper.customizeNavigationBar()
        return true
    }

}

