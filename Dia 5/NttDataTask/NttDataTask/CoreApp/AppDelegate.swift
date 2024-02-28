//
//  AppDelegate.swift
//  NttDataTask
//
//  Created by Guillermo Rodríguez ALonso on 27/2/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    let appCoordinator: AppCoordinatorProtocol = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let screen = windowScene.screen
            window = UIWindow(frame: screen.bounds)
        }
        
        if let windowDes = window {
            self.appCoordinator.initialViewController(window: windowDes)
        }
        
        return true
    }


}

