//
//  DetailCoordinator.swift
//  AppIntroTableView
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit

final class DetailCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view(dto: DetailCoordinatorDTO? = nil) -> DetailViewController {
        let vc = DetailViewController()
        vc.nameMonths = dto?.nameMonth ?? ""
        return vc
    }
}

struct DetailCoordinatorDTO {
    var nameMonth: String?
}
