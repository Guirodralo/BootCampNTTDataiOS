//
//  AppCoordinator.swift
//  AppIntroTableView
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit


protocol AppCoordinatorProtocol {
    
    func showInitialVC(window: UIWindow)
    
}



final class AppCoordinator: AppCoordinatorProtocol {
    
    private var initialViewController = UIViewController()
    
    
    internal func showInitialVC(window: UIWindow) {
        self.customUI()
        initialViewController = HomeCoordinator.view()
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
        
    }
    
    private func customUI() {
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        
        navBar.barTintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        navBar.barStyle = .default
        
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
    }
    
}
