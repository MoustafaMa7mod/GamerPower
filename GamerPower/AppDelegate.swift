//
//  AppDelegate.swift
//  GamerPower
//
//  Created by Mostafa Mahmoud on 14/02/2025.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        // Set Root View Controller with SwiftUI
        if let window {
            appCoordinator = AppCoordinator(window: window)
            appCoordinator?.start()
        }

        return true
    }
}

