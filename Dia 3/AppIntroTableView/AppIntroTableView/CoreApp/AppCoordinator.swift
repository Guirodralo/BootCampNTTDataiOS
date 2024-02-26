//
//  AppCoordinator.swift
//  AppIntroTableView
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit


protocol AppCoordinatorProtocolo {
    
    func showInitialVC(window: UIWindow)
    
}



final class AppCoordinator: AppCoordinatorProtocolo {
    
    private var initialViewController = UIViewController()
    
    
    internal func showInitialVC(window: UIWindow) {
        initialViewController = TableMonthCoordinator.navigation()
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
        
    }
    
    
}
