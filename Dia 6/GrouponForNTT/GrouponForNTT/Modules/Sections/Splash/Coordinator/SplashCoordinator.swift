//
//  SplashCoordinator.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import Foundation

final class SplashCoordinator {
    
    static func navigation() -> BaseNavigation {
        
        BaseNavigation(rootViewController: view())
        
    }
    
    static func view() -> SplashViewController {
        let vc = SplashViewController(nibName: SplashViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: SplashViewController) -> SplashPresenterProtocol {
        let presenter = SplashPresenter(vc: vc, router: router(), interactor: interactor())
        return presenter
    }
    
    static func interactorOutput() -> SplashInteractorOutputProtocol{
        let presenter = SplashPresenter()
        return presenter
    }
    
    static func interactor() -> SplashInteractorProtocol {
        let interactor = SplashInteractor(presenter: interactorOutput())
        return interactor
    }
    
    static func router() -> SplashRouterProtocol {
        let router = SplashRouter()
        return router
    }
}
