//
//  ListaContactoRouter.swift
//  NTTDataTaskChallenge
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import Foundation

protocol ListaContactoRouterProtocol {
    func showDetail(dto: ArrayContact)
}

final class ListaContactoRouter {
    
    let vc: ListaContactosViewController?
    
    init(vc: ListaContactosViewController?) {
        self.vc = vc
    }
    
    
    
}


extension ListaContactoRouter: ListaContactoRouterProtocol {
    func showDetail(dto: ArrayContact) {
        DispatchQueue.main.async {
            let vc = DetalleContactoCoordinator.view(dto: DetalleContactoCoordinatorDTO(modelData: dto))
            self.vc?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
