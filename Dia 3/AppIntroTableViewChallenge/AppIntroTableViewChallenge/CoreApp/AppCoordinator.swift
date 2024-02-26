//
//  AppCoordinator.swift
//  AppIntroTableViewChallenge
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func showInitialVC(window: UIWindow)
}

class AppCoordinator: AppCoordinatorProtocol {
    
    private var initialViewController = UIViewController()
    
    internal func showInitialVC(window: UIWindow) {
        initialViewController = TableMonthsCoordinator.navigation()
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
    }
}
