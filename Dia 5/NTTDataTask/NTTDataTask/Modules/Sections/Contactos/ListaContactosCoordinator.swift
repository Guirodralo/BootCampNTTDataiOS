//
//  ListaContactosCoordinator.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import Foundation
import UIKit

final class ListaContactosCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> ListaContactosViewController {
        ListaContactosViewController()
    }
}
