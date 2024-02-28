//
//  DetalleContactoPresenter.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import Foundation

protocol DetalleContactoPresenterProtocol {
    
}

final class DetalleContactoPresenter {
    //MARK: - Variables
    
    var modelData: ArrayContact?
    let vc: DetalleContactoViewController?
    
    init(vc: DetalleContactoViewController?) {
        self.vc = vc
    }
    
}


extension DetalleContactoPresenter: DetalleContactoPresenterProtocol {
    
    
    
    
}
