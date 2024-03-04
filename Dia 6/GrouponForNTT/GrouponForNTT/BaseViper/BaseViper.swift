//
//  BaseViper.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import Foundation
import UIKit

class BaseViewController<P>: UIViewController {
    
    var presenter: P?
    
}


class BasePresenter<V, R, I> {
    
    var vc: V?
    var router: R?
    var interactor: I?
    
    convenience init(vc: V, router: R? = nil, interactor: I? = nil) {
        self.init()
        self.vc = vc
        self.router = router
        self.interactor = interactor
    }
}


class BaseInteractor<P> {
    
    var presenter: P?
    
    convenience init(presenter: P) {
        self.init()
        self.presenter = presenter
    }
    
}


class BaseRouter<P> {
    
    var presenter: P?
    var viewController: UIViewController?
    
    
    convenience init(presenter: P? = nil, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    func push(vc: UIViewController) {
        
        if let navVC = viewController?.navigationController{
            DispatchQueue.main.async {
                navVC.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    func present(vc: UIViewController) {
        DispatchQueue.main.async {
            self.viewController?.present(vc, animated: true, completion: nil)
        }
        
    }
    
    func popView(){
        if let navVC = viewController?.navigationController{
            DispatchQueue.main.async {
                navVC.popViewController(animated: true)
            }
        }
    }
    
    func dismiss(){
        self.viewController?.dismiss(animated: true, completion: nil)
    }
    
}


class BaseNavigation: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
