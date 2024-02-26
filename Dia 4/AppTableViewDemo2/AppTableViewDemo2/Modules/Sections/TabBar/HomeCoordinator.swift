//
//  HomeCoordinator.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit

final class HomeCoordinator {
    
    static func view() -> HomeViewController {
        let vc = HomeViewController()
        let vcListaCoor = ListaCochesCoordinator.navigation()
        let vcPerfilCoor = PerfilCoordinator.navigation()
        vc.viewControllers = [vcListaCoor, vcPerfilCoor]
        return vc
    }
}
