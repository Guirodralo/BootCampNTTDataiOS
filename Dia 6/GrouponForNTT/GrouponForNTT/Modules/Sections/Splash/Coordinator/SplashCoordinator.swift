//
//  SplashCoordinator.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import Foundation

final class SplashCoordinator {
    
    static func navigation() -> BaseNavigation {
        
        BaseNavigation(rootViewController: view())
        
    }
    
    static func view() -> SplashViewController {
        let vc = SplashViewController(nibName: <#T##String?#>, bundle: <#T##Bundle?#>)
    }
    
}
