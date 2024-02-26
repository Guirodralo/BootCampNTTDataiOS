//
//  ListaCochesPresenter.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit


protocol ListaCochesPresenterProtocol {
    
    func setArrayData()
    
    func numberOfRowCell() -> Int
}


final class ListaCochesPresenter {
    
    let vc: ListaCochesViewController?
    
    var arrayCoches = [CochesModel]()
    
    init(vc: ListaCochesViewController) {
        self.vc = vc
    }

    
}

extension ListaCochesPresenter: ListaCochesPresenterProtocol {
    func setArrayData() {
        self.arrayCoches = [CochesModel(name: "audi", color: "Rojo", image: UIImage(named: "audi"))]
        self.vc?.reloadData()
    }
    
    func numberOfRowCell() -> Int {
        return self.arrayCoches.count
    }
}

