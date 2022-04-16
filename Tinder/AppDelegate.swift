//
//  AppDelegate.swift
//  Tinder
//
//  Created by Rodrigo Vart on 27/02/22.
//

import UIKit
import FBSDKCoreKit

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let facebookInstance = FBSDKApplicationDelegate.sharedInstance()!
    static let shared: AppDelegate = AppDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         return facebookInstance.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
          return facebookInstance.application(app, open: url, options: options)
    }
}

//IGQVJWWkRuQVpORW5MZADY3eHBCQWdXQ1N4U2ltbzJjU3prMF8tQkJVSUpZAbDVrb3p5X2d4Ty1GS21NNXkyQzMxWVpVSXliLXo5eTVKX25YSEpWb2lkbkRFT2hneHZA6QlJ2azFRam03MDJfOXloV2FhNAZDZD
