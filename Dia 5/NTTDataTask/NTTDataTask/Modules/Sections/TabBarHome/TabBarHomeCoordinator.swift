//
//  TabBarHomeCoordinator.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import Foundation
import UIKit

final class TabBarHomeCoordinator {
    
    static func view() -> TabBarHomeViewController {
        
        let tbVC = TabBarHomeViewController()
        
        let listaVC = ListaContactosCoordinator.navigation()
        
        let customButton = UITabBarItem(title: "Mis Contactos", image: UIImage(named: "TRIFECA_0M")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TRIFECA_0M"))
        
        listaVC.tabBarItem = customButton
        
        let nuevaTareaVC = NuevaTareaCoordinator.navigation()
        
        let customButton2 = UITabBarItem(title: "Lista de Tareas", image: UIImage(named: "TRIFECA_1M")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TRIFECA_1M"))
        
        nuevaTareaVC.tabBarItem = customButton2
        
        //3
        let listaTareasVC = ListaTareasViewController()
        let customButton3 = UITabBarItem(title: "Lista de Tareas", image: UIImage(named: "TRIFECA_2M")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "TRIFECA_2M"))
        listaTareasVC.tabBarItem = customButton3
        
        
        tbVC.viewControllers = [listaVC, nuevaTareaVC, listaTareasVC]
        return tbVC
    }
}
