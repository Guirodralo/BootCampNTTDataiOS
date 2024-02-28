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
        let vc = ListaContactosViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: ListaContactosViewController) -> ListaContactosPresenterProtocol {
        let presenter = ListaContactosPresenter(vc: vc)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func router(vc: ListaContactosViewController) -> ListaContactoRouterProtocol {
        let router = ListaContactoRouter(vc: vc)
        return router
        
    }
}
