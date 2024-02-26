//
//  ListaCochesCoordinator.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit

final class ListaCochesCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> ListaCochesViewController {
        let vc = ListaCochesViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: ListaCochesViewController) -> ListaCochesPresenterProtocol {
        let presenter = ListaCochesPresenter(vc: vc)
        return presenter
    }
}
