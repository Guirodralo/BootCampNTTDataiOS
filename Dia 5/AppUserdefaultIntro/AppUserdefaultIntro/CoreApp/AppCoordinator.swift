//
//  AppCoordinator.swift
//  AppUserdefaultIntro
//
//  Created by Guillermo Rodríguez ALonso on 27/2/24.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}


final class AppCoordinator: AppCoordinatorProtocol {
    private var initialVC = UIViewController()
    
    internal func initialViewController(window: UIWindow){
        self.initialVC = UserDefaultViewCoordinator.navigation()
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
    }
}
