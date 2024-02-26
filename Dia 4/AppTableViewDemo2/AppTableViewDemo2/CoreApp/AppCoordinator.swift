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
        initialViewController = ListaCochesCoordinator.navigation()
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
        
    }
    
    
}
