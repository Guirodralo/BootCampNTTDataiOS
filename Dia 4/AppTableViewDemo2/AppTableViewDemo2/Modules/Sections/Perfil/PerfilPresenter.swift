//
//  PerfilPresenter.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit


protocol PerfilPresenterProtocol {
    
//    func setArrayData()
//    func numberOfRowCell() -> Int
//    func getInformationCellForRow(indexPath: Int) -> CochesModel
}


final class PerfilPresenter {
    
    let vc: PerfilViewController?
    //var arrayCoches = [CochesModel]()
    
    init(vc: PerfilViewController) {
        self.vc = vc
    }

    
}


extension PerfilPresenter: PerfilPresenterProtocol {
    
}
