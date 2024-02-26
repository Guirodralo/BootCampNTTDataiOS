//
//  AppDelegate.swift
//  AppIntroTableViewChallenge
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCoordinator: AppCoordinatorProtocol = AppCoordinator()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let windowDes = window {
            appCoordinator.showInitialVC(window: windowDes)
        }
        
        return true
    }


}

