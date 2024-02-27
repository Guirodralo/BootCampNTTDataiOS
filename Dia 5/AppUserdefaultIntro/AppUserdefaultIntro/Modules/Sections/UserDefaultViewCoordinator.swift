//
//  UserDefaultViewCoordinator.swift
//  AppUserdefaultIntro
//
//  Created by Guillermo Rodríguez ALonso on 27/2/24.
//

import Foundation
import UIKit

final class UserDefaultViewCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> UserDefaultViewController {
        UserDefaultViewController()
    }
}
