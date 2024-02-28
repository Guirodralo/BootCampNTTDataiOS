//
//  DetalleContactoCoordinator.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import Foundation

final class DetalleContactoCoordinator {
    static func view (dto: DetalleContactoCoordinatorDTO? = nil) -> DetalleContactoViewController {
        let vc = DetalleContactoViewController()
        vc.presenter = presenter(vc: vc, dto: dto)
        return vc
        
    }
    
    static func presenter(vc: DetalleContactoViewController, dto: DetalleContactoCoordinatorDTO? = nil) -> DetalleContactoPresenterProtocol {
        let presenter = DetalleContactoPresenter(vc: vc)
        presenter.modelData = dto?.modelData
        return presenter
    }
}

struct DetalleContactoCoordinatorDTO {
    var modelData: ArrayContact?
}
