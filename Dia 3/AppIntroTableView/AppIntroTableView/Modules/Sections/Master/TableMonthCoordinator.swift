//
//  TableMonthCoordinator.swift
//  AppIntroTableView
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit

final class TableMonthCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> TableMonthViewController {
        TableMonthViewController()
    }
}
