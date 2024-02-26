//
//  TableMonthsCoordinator.swift
//  AppIntroTableViewChallenge
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit

final class TableMonthsCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> TableMonthsViewController {
        TableMonthsViewController()
    }
}
