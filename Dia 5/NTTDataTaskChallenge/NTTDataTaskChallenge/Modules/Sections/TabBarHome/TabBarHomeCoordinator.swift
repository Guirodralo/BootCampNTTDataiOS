//
//  TabBarHomeCoordinator.swift
//  NTTDataTaskChallenge
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import Foundation
import UIKit

final class TabBarHomeCoordinator {
    
    static func view() -> TabBarHomeViewController {
        
        let tbVC = TabBarHomeViewController()
        
        let listaVC = ListaContactosCoordinator.navigation()
        
        let customButton = UITabBarItem(title: "Mis contactos", image: UIImage(named: "TRIFECA_0M"), selectedImage: UIImage(named: "TRIFECA_0M"))
        
        listaVC.tabBarItem = customButton
        
        tbVC.viewControllers = [listaVC]
        return tbVC
        
        
    }
    
}
