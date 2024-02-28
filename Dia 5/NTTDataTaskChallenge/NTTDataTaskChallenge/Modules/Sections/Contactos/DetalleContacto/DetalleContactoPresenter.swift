//
//  DetalleContactoPresenter.swift
//  NTTDataTaskChallenge
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import Foundation

protocol DetalleContactoPresenterProtocol {
    func getDataModel()
    func informationData() -> ArrayContact?
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
    func getDataModel() {
        self.vc?.reloadDataModel()
    }
    
    func informationData() -> ArrayContact? {
        return modelData
    }
    
    
}
