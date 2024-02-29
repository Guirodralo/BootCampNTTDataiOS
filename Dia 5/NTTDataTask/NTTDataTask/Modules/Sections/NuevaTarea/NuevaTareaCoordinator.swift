//
//  NuevaTareaCoordinator.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 29/2/24.
//

import Foundation
import UIKit

final class NuevaTareaCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> NuevaTareaViewController {
        let vc = NuevaTareaViewController()
        return vc
    }
    
}
